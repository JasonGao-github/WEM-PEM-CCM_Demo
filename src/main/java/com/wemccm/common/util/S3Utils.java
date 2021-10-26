package com.wemccm.common.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3Utils {

	private final static String AWS_ACCESS_KEY = "AKIAV5CZ5OALRTUOSX5W"; // 【你的 access_key】
	private final static String AWS_SECRET_KEY = "/iNh8/O+a//SeSj19li+Z7LGA7KPcuc5o2rM0XFj"; // 【你的 aws_secret_key】
	private final static String bucketName = "wemccm"; // 【你 bucket 的名字】 # 首先需要保证 s3 上已经存在该存储桶
	private final static String bucketFloderName = "/upload";
	private final static String bucketPath = bucketName + bucketFloderName;

	private final static String AWS_URL = "https://wemccm.s3.us-east-2.amazonaws.com";

	public static String uploadToS3(File tempFile, String remoteFileName) throws IOException {
		try {
			AmazonS3 s3 = new AmazonS3Client(new BasicAWSCredentials(AWS_ACCESS_KEY, AWS_SECRET_KEY));
			s3.setRegion(Region.getRegion(Regions.US_EAST_2)); // 此处根据自己的 s3 地区位置改变

			s3.putObject(new PutObjectRequest(bucketPath, remoteFileName, tempFile)
					.withCannedAcl(CannedAccessControlList.PublicRead));
			GeneratePresignedUrlRequest urlRequest = new GeneratePresignedUrlRequest(bucketName, remoteFileName);
			URL url = s3.generatePresignedUrl(urlRequest);
			return AWS_URL + bucketFloderName + "/" + remoteFileName;
		} catch (AmazonServiceException ase) {
			ase.printStackTrace();
		} catch (AmazonClientException ace) {
			ace.printStackTrace();
		}
		return null;
	}

//////	// for test
//	public static void main(String[] args) throws IOException {
//		S3Utils s = new S3Utils();
//		File uploadFile = new File("/Users/gaoxiang/Desktop/1.docx");
//		String uploadKey = "18";
//		String ss = s.uploadToS3(uploadFile, uploadKey);
//		System.out.println(">>>" + ss);
//	}

}

Return-Path: <linux-mips+bounces-7218-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C09FF93D
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 13:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98FE57A01C2
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 12:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31D218E37B;
	Thu,  2 Jan 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ASNsGRkM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A9NkmNVo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE3C405F7;
	Thu,  2 Jan 2025 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819939; cv=fail; b=k3YDGwpib4Ogqc+3XDXLIaORVaO8JEuBFCNHC63uihCkzD5AYLy1ThWCq4iXVglRC4tHBRlzU7jAohogfQHOs1Kg/g9C+DubRZOW9j++vV5LzpMXkq86z854DnQsX2Tb1/V1Tw1L43o/+wBWGplxOO11Gs7Vibt2ncbQohW32JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819939; c=relaxed/simple;
	bh=qHNz9b/eSFpH8qEyVpzIeUYLQPnOLOV51BbFtVT9n/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZ+45BtCFwVzNHrczYB0a3JdTrgjgnQU1R+666PV86WAKZL+6XOR6PmCimVTPrRu//IzzvcChXn82vwTiEaidzRiXXAkR4xceRJD9Hajh1pDVHk/+KnbRnMQhPDp1LWv4NOvHsfEXMgFyOxBcPlp6TFXNGWPZatL/LA6eh90Dgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ASNsGRkM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A9NkmNVo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5029fmLs008118;
	Thu, 2 Jan 2025 12:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=; b=
	ASNsGRkMgq7hkV6InQGJ+KY4u6RxVtKs/Q5SUaZgNmCbGmt22aUaFzK9QblyuFLk
	dtpviT1kDwRGiP+RDy4q9D4t51TGWUoEc9zYsBB+1fZx6xd4VRMPTK0jjaEd2H7d
	PNkij5sBjYoitlmHEVYl9PivcAkS3jIZUvzNI1n/M6eMawH9NXXP828L450QbWHt
	P45BAEOX3+Mt3ukGF+8xeHyPxXMsHZEGw8csWnVpbuEuJ5XhfyDcUckEqEyLWtGc
	5w+SwbtE70bK8B+wE+Gxjb+3PrWrMOpQB/FGqGMo4DB2JIeaUtKLbxgejFU4nBIF
	vS1kSQ9+rYjRsieAdapbyA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t9chda1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502A0OjU027772;
	Thu, 2 Jan 2025 12:11:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43vry1hjag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr9sZzLoxSVMPPwpk6pcjMmKBKZ9ju3rRivFRWUgBotZnPK3xyVP5FiQiM997tRde63F/U3W0jTJQPk92n7Q9j8oH/kAgIc6lkdBhQYvhhNL+55HWfLJ2XPfgLkFkYRGF9b6+7aO3S/v5V/XC3jeD8qyGVrA1gG9iWv+fshsuvpmQYgwo4xoyP6DE99MVZzFi60cYNgFzcRwFY/xvzlSqPhtERuIktQDXWWZ6azZnAn9dzjjFebZrpPdwfu1AVlinWVpbN/PL15JBi0uNcv8RNiW4iV2ThcEdXm0uzTL0ShYGkBXzTEW9qJPE5VK6IEX+OTVvGTPWxiiRA0x8SOS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=;
 b=Redrj1GjPZcHWKtQUbH15qV1cQGMxZ3Vz7jR/Nhcmz9P5G/S9plIc90ElpZSXnCb1xSTu0OCAL4saJXkKQ6p+NtsS+fqegkI7ycWm3w0I3YKYXvpbMN7qpV/ettI43L35JDpu1sAPrs+PpcGCykycmnqoW1gYZvoy/qnarEZQHswSM7KUhYi8xtO+YRHJSSCqxUjanTLzm8EgCujV00RbLBoBVUTYmgY/MAShFo70PWkTl8QtjASDDorNG5U3n6/TpHv1Q+aO4TxnsqBUr0Q4T9AljxV6u1vWYzVivzFbSxy7aBl0zmW8MNeoFQLJ98m9ECrmpmdDqt9hprYLRBBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=;
 b=A9NkmNVoD22Y8/tSItisGorjy4u5CUPlMwtggUSj5YEq3FdiL5XxKjE72beoLku2mn5Rd2oORMtZXGI5FcLmJXnIXBrO5sh26f2phmtAa3dhLJnpl+cEk406E2ZZUB/Q3h0uuz6boTSbJCHu+oszg1tcfLzskxSZP9+mErU/LJI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 12:11:47 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 12:11:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 1/2] mips: vdso: prefer do_mmap() to mmap_region()
Date: Thu,  2 Jan 2025 12:10:51 +0000
Message-ID: <ef076e381570f709e5c2c142dc030ec5b3309a0e.1735819274.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
References: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 0524e643-81b8-4ed0-2c20-08dd2b26a115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AgAChrfpVX6vHlofdN86Swu5RpcLr+BoM6Rmo9F5TONJV1UdE1djI5wLXMUv?=
 =?us-ascii?Q?kczlXPP9KyLY1P5gcQbOpOKneDAXXrrzNjGuWBSJ0roikmJT9FY1uiQuRfjx?=
 =?us-ascii?Q?SmQF9GQa9wWRDzcGIF+ZKCtQTlj6Y6Bs4apOxjRSrfTwYYtNFZTC/bjnTThn?=
 =?us-ascii?Q?vqjQ0MDlwfTx/gyvbPz7RBNH6hMPG/jiR47xk1tY08ATZPwnPQCZMSqB+IfR?=
 =?us-ascii?Q?DLC/r8RX8EzmwwCMfECQEqIJnKWyQ+IVeBdxni8G30C+lKQ1yzsiVr+tRAem?=
 =?us-ascii?Q?xKV/Gw+tBl6K3FrcrYkeGbGXJi5/hlPSLBK8V9uKspKmUuKyXpJ5u938QEcy?=
 =?us-ascii?Q?upd69oK8FMKihKrTfRZsFlhdrQHwOPXyKa6w6Oh29hABYwjVQi+3DdBgyTp9?=
 =?us-ascii?Q?yWR/QpjA3R+qZ5SHZDpCEyYjItWxNtJjZ48fxZEv2p/9DTSTC4R0agK/z7/f?=
 =?us-ascii?Q?eJSkabWVSdA9nsnlSRRfbCX8vG2M7yYC3PzamDGWT1ujsssEMRFhvuqs3ve/?=
 =?us-ascii?Q?W4W1dkxDqUfDC3SspxNkpIMEYOO/kYtSfDwa7EjYJk9Gk73hx4it1qzEZS2P?=
 =?us-ascii?Q?iwc+Bsi19dSxcwWwHnmOv8FR9s+0ixBKRxEl98ySBohuhfIYPZ6sngO6mdns?=
 =?us-ascii?Q?1Rjnv/9A8bLEZtvAyzsdu94P4lqbkYAPHreGdJ90xcWu3LcEsDoF9OqJEThV?=
 =?us-ascii?Q?advfoZcVo+T9P1J+/geIS0ZJJkEfui6kLfvMx12dXL79fIxP+7TmZHTlpPUi?=
 =?us-ascii?Q?cNs7a0MB5Ee0yDGnwm6gFHTqJdYn0cJf5zQPQoR/YSQn3ctiPBP96KDFmpHr?=
 =?us-ascii?Q?3pc62ja0IoVIreiRvV1GoGXYTYWhGSmWg8rcuGR+PsDEliXx8kM3ni35i4/j?=
 =?us-ascii?Q?z2m0UkUwZBaRRxwsVaP7PZRLl77VIHtOxHlYE45wqGwESktB7UvcsYP/l0mE?=
 =?us-ascii?Q?F8juDcGjyqgmvv+ZEEG80GnzYyO6U48eMdiXwIvrbNd2YRAGyB4nZuCQAzoj?=
 =?us-ascii?Q?zFtO0WrtScoc3bZsqESPUrZ7XlZH2vtsJNEOhctJmzdOStLVtxUbkwwf5Ny1?=
 =?us-ascii?Q?xbvdW7/hgyuGfNdf7iCwMiXcrKf8s0iAXY+1dDmgU/BQxadwl22wlvODI1QY?=
 =?us-ascii?Q?DNLKtXWs4UKl7FwjiV9MMe29PktaHSUpWSl+VPB79fQFXgw4OFYx3rCoDMfJ?=
 =?us-ascii?Q?7Uxi8UGpdNQ2Yn0C3f7UlJUUFdRKGX6a1QpUiohvurgGodW7Yq9h4tVg56OP?=
 =?us-ascii?Q?Y/JRK1euJZIFwl0pJUUQTkN1kxjXIxhY+mg+Ua619QjjAY/iOwAt1gUi77HZ?=
 =?us-ascii?Q?JPhNScC5GiZJ0LF8XywRTAqJ/SW62di+Igtj+0b5p8xKe2GYaqKF6UHqqhsU?=
 =?us-ascii?Q?rYFHD1ZNyd/M+oNpxo7SgYkFOQ0P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ZGAVV6hA58POmps4OeHAMv98qmTerwyQUOlZiBSgookdiQAi4tWdIgsdqv9?=
 =?us-ascii?Q?cQ9an9iZbCq7coGTLXuvFkZKTKC4rifZo9QsV6hTLM2WBxYKlwWZ9QQGWFlE?=
 =?us-ascii?Q?hKstQp1bV6os0RZWpr8SaOlcsJ7Ld6SmBH1LQJTvtFYYvSBWprF1pnCg9s08?=
 =?us-ascii?Q?Oq4uJZOpoxOr9T9eCbX/9+GIwtI04f5AwRK1jbiWJANxA0JBkDvoIuYDXVdN?=
 =?us-ascii?Q?9ZhUxbcMlnHNlo24CPDeYtX0s55UxokuC+tAytpmSs6teWKcEAPeaiXrtTjV?=
 =?us-ascii?Q?oaKonpFElOK484c2yqAvzgH+ENKQNwfk5XZ2CKKF7/gG/a8Z2K0Wk8k6oTVk?=
 =?us-ascii?Q?wo1VI0+YWDaXHl7E63nn7dcwIZ7uk8Aez2ZEuITRFa8mhs6WZuj+dIStvIq4?=
 =?us-ascii?Q?CLO/lsCqfWX3x9owgbM298IM1UYLtE93qWh9pZKGoYys3Zbsbu4Qyh/SUL5b?=
 =?us-ascii?Q?04EN078DubhHx5soiMKG/XzsGXjF/sQPCcQe/210TtZS/4fWvAvJ5Z91LYqg?=
 =?us-ascii?Q?hnz3ZopZNiy6YN9hTysZLFHbzQAnZKl7idRLv9Rwap/nqPQ6EIrXtLWgeJu6?=
 =?us-ascii?Q?bxWtk3AXsq7u42Mc2llg+/+cTC+pH4PF0bw+Yy9ZkBWqNr9s7p7pJ1w9/cwT?=
 =?us-ascii?Q?kPEQeEuQgYer6VduVh5Y+MxdujFONzdKPABZ+gwDzus7z+WlYiRPRgsAckSs?=
 =?us-ascii?Q?MuLo89lMvL8wZ2GLEP9781gybMRo7Sgl7kRqEYSdPe654e12ZtR0etoCcWry?=
 =?us-ascii?Q?vdm+WTq+/PgnNZfXljUtqndmWYJlVe+Or1YxUVPdZPtM8jci7FWcO+vYECnr?=
 =?us-ascii?Q?4S8JxBm8xU0DDUoS3sKLmJaS0Rge9FnjaEwHWLHL2PvB/wwOs6iiGYdflPnB?=
 =?us-ascii?Q?sIC+iC62rHgu04hoTG42Yxjwm+YLdltGiUAbYXkLBgABxi1DJO1uG9zezcdM?=
 =?us-ascii?Q?MV5+nl2bEusHW1EOfom8jbDm3LKYAdFJXlbt+aR+mecyh0/mRrD76ItrN5SS?=
 =?us-ascii?Q?Rambr1ZzoHjYVcw3ZmB9jv61K9h+n3S79b4M1zhhzmm9UODLcPf+f5FBIamU?=
 =?us-ascii?Q?EWi67ruJHcvOVBFMR7nMzBQ/IEUWQP4/5WbhaX3L7S9VHNT6pZZlTl4NHGw5?=
 =?us-ascii?Q?dsMVyaWJhp/pq6ZcKgJGR3Y8N3QB5bkz9P96GU1j5mqrVwDJe1ZghK7xqldq?=
 =?us-ascii?Q?eIftaMOzb/lbZiGjdgg7y9Lrq1gYg/IClwBinJWcMsi1wbhVEu92W+IPaN0B?=
 =?us-ascii?Q?kza8otAa9E+yPTTh5Oot8Y8u9gYczSH3WGPsHg46jOfPz/QzcvIEpK1loQbi?=
 =?us-ascii?Q?nD5yEix/NsLSgif4Dyb8YOTNphFcOEZPaq/XWheD0IkKmiVxNJ6YK15oPwlP?=
 =?us-ascii?Q?KFqwcxiR5hdYuHE1mqSlsqZNYkzZf7F1JXALn6KfuzuENd7X9iXTfaYRJjio?=
 =?us-ascii?Q?vvfIE/ioYf9v26ZiW8qs6AwmPdvkG673Y450qKveISEYakis64gRytFsBHsC?=
 =?us-ascii?Q?8roz0gVDn0b39A8AiYnb7Tm2mTohVACSQ9BiJTApHK31dAzpsTCkBc3GbKVv?=
 =?us-ascii?Q?jCAJb7dazM2IK6NK9qVOAqrGTJ2Vqj8B9hRgZcJ1dWmWDNwFS2g994ghX91t?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FV7cAkKI36KsQV8+WydszyeNZEUGLI+g6jWbrzWWwKaQlyUWJMAmvPdh1PXbg+GFUVjA2lR2l0Ul0co3pO/g+Qub4fhQw+W3gGHy592mz50hA6aTt+NbBlUE/1CyCmoDbOWoCc2JpyfptDMCsPRIlyIXNQNklrVFfunXArpfkniBD3LTmIqNAV4uAhgAtzmGu3Cw9VnzMdmv/6h9IDRdPg7OHLVLgwRaYoN/j3erJpQVXFIB3Li8lngeGXzSV28Zw8H34rNgSMRY6WyYaRsnAmsgKHzSZROtpEcZgHfVCikykkub6WYE8RjIK8nTeimFkiTL9G+GhrMV0UmPynYo24/TEkY5kaNE2GuNgB4ywXnMlOBwxx6DjvRuC22jT58Sk6eLEmnUy5mG2GE/N3JyCitg+N3Mc9GAjjXRAVmJufDzkoVFTTj7kHWikOXl8+0g7/bleBHyltCcJhFD9C18hPxqO/ynUBbHaS0gdhnPVvY4b/BujuXyLOrQb/eBmLNdNn5tV+6EY95p89OPS66CNiedn2UseGSpkPHHTIIuxBXGINoOhQTIyTQS+fFIfX9Q0P3CwN6MqgCOlU3MPrNeRQG3F6+096PY2YghUaQgltw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0524e643-81b8-4ed0-2c20-08dd2b26a115
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 12:11:46.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJ7Cb590TG1MywmBhzCBTnse+KjRiv2up9XqLJ4g6GQEgv5+wJgd5wxGDXR7mKCh2WgdY6fJ6BMGQBJz+tsEMr/HDdsXcgQ8740cZ6/scfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020106
X-Proofpoint-GUID: pr60IA1CrjlERYXzj9qdcn1jeDcnFAi0
X-Proofpoint-ORIG-GUID: pr60IA1CrjlERYXzj9qdcn1jeDcnFAi0

mmap_region() is an internal memory management implementation detail that
is not intended to be used outside of the memory management subsystem.

Map the delay slot emulation page using do_mmap() which makes use of the
already-held mmap write lock and bypasses unneeded populate and userfaultfd
logic.

This should have the precise same behaviour as the existing logic.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 arch/mips/kernel/vdso.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 4c8e3c0aa210..75c9d3618f58 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -11,6 +11,7 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/mman.h>
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -97,11 +98,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		return -EINTR;
 
 	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
+		unsigned long unused;
+
 		/* Map delay slot emulation page */
-		base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
-				VM_READ | VM_EXEC |
-				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
-				0, NULL);
+		base = do_mmap(NULL, STACK_TOP, PAGE_SIZE, PROT_READ | PROT_EXEC,
+			       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, 0, 0, &unused,
+			       NULL);
 		if (IS_ERR_VALUE(base)) {
 			ret = base;
 			goto out;
-- 
2.47.1



Return-Path: <linux-mips+bounces-7220-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A812D9FF93E
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 13:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3483A06C7
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A4E1AE876;
	Thu,  2 Jan 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BXdKqtPs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CfFQnIc8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27616A395;
	Thu,  2 Jan 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819941; cv=fail; b=cdY7LaQpO86P9tCEeiL87dStqTIBjAJSfcmU4VVpjITAT8SgbvpGC/8M2rscjXN5gqdFWZW4k73DEI+oEZdvL0ztR8YfnqZ7hJO9QbRsZFjXq84Q0QwLL1AkpSYicElY4qovtlDNIZxINrQMHv+n2pmxI3VcX6jeAQBnAtwrIAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819941; c=relaxed/simple;
	bh=LiFdigqvK0AGIgdLaeavWKIqbEFNRBRGYOeOZw9zWek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ru9/kUb1i+GShuV4YXpbRlK4alyWp6t6r7+ArLlTWTQwZiqrs5EeFuD4bD/pwkMyXxKAsGsAnToKNAfINttsDFyYdgpboUnHZX7ozzy2mEL5Bwe3KzN7pIstE9UZ1AtevwfJ4JMICUf1bMZkHNJG3EkqeGP95/xAlfFiDV6MptY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BXdKqtPs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CfFQnIc8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5029g0Um023923;
	Thu, 2 Jan 2025 12:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=z15p6HFmxHvoiaIRhRsc4oMsT/fB/eYKW4sNfhR5geY=; b=
	BXdKqtPsm6QyBzfcuuM6JhO+VTWRKbh2pg4wn+Gs4IWRTlCB4SepGytzT4dVXJDs
	PPQVqUGJXjVQTi6hnnD03hzGymsNkcUd0SrCb4d5f7XwRR28MqFvIT1JFyr+FbS1
	5H6KuURekfifD6BS1ZBe1xwyswE84UIo554tLX4ytxN9IRRzJiVfIq9wb2Bkhj5Q
	qscahM9epUh1vYCl19057NBYixfs4F3kY2l88L/Np/HmppbFlT8yzWOFFSTL5nHR
	D5A79JMf6YORPaTcKfd2/xCwTqVsHd12iZlltFfdcD3AFqb4vG/qZcSIey/79Qcn
	qZdaAxzHRBBDXPKtWdyEpw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t88a59cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502BLexY009459;
	Thu, 2 Jan 2025 12:11:56 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8fq32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/bDDo0sV8JfOnU5gwITJiy2v/CXw4Jk9AeaW+GWU2TMqZUXVh7C6Grpb+CDbPwS8FmW65XSgoau/vinFUkzLSESQS4nRTWlQmUmMniWKBTHlws/UZ6UXJ8zAxPjl7vIRW5BLPwU2Xum1b3ZQB6jpMBXzYscUbKNaBlFTKSTfLDJ39y+2gkeZ7k+oc/OzbkwPWmgUOh+m+lvTRNv0ebFBeMwo6w/aoi4ACw32kW87iz3c9XBp2SHRvpSongSlkj9vwe2wCW2m82kpDKXqWQt36Osc2Rym0wiXmKXaZ/trkiukwAJY39GORtB/lwkvUsPZ80Sml7th190li9LADWCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z15p6HFmxHvoiaIRhRsc4oMsT/fB/eYKW4sNfhR5geY=;
 b=gwvygueJ1x7aXjMFPGa+90qOKPGDJz4qeLf+tohp5/42NySrDsqHtxZN5nyc7jGAP2lcdAosqwEF/AExwuPJ/v/AX6Vab3gByJUmxQVyjZRTEy6aHSraOnuhrG3DJEwgeDkVEHHclCcIlSZTnsnlE/ZCuMjx+/FTW9DvspkAJiFwY0AloIAVg1D8nxNeNP/IhZjGK6E5QA9BD1lVHyXYsDflI1ymiwf5DecRt8jq5oqnQ0DlKubJBWPB769qrFAhF4tSNNSM3z4Y+4n7KRaI6wCux+vG8Fv1zM0XEyQRXj4QWD8HFCHpZ73vXRtAPZQtMnCOb4QklTf6kLoXmhGxNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z15p6HFmxHvoiaIRhRsc4oMsT/fB/eYKW4sNfhR5geY=;
 b=CfFQnIc8IXTR0j1Dkfw667ORrbFuDBTrauq0Wraxrj6JpYnB4tSiDhB3F3XLWdHY72eKsQMm7+eRQSBWKvkO51WgLV1h3QY08AZIldAb0C2QCtqo0L9W9Kxi4n6/92MGKw0bShtuGB03mg6p9fcSRKnHHLLlhL3DdzzaIiY2aMY=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 12:11:50 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 12:11:50 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 2/2] mm: make mmap_region() internal
Date: Thu,  2 Jan 2025 12:10:52 +0000
Message-ID: <de5a3c574d35c26237edf20a1d8652d7305709c9.1735819274.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
References: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dfccb49-5de6-4030-ddce-08dd2b26a341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+0FzitjbfeF8kt0cxwFdUofkpkID38ZzAUrsQqzq3yxBNjQAVzezo+bH4nOz?=
 =?us-ascii?Q?6vEY4NL3y8M/DOV9exQZ6NagDUNeWt9UiMP6QlVdKu3E2wi4FRlw1J8Ww/i0?=
 =?us-ascii?Q?OIOSUlpc/J+7SNQGTV8fWnXY0VptofqVelg1yn5al0N2oUBFBWdQYa/dza0U?=
 =?us-ascii?Q?ksvVuoI2bPcoeSPwX/pt5vcfcRiNaumCiN7uiIwhE3PRc+uwh3yDZGuNHoK3?=
 =?us-ascii?Q?FN93cRxQRw5Uk1n+BO0fyeTVNJTE7ho2PYWJhCVuNMDBNGuJQyvcbPrm/h6E?=
 =?us-ascii?Q?u8TZSbiZLFOOUowBMyv09ajLp8rhuZkJ9PUVcj5MY4T6GgfQ28lZeON/bydg?=
 =?us-ascii?Q?pQrHi+5d2lYDS35nGyoo29tpV0r7bUHuzFEMf2FePt9cgiAYHqKzZvLu2gBw?=
 =?us-ascii?Q?Q5l7BeVsnOdGCkSY8Dspv0ZrTs2WNVSfoANRgYHxNiXDUR30UsQOd2QqfXxU?=
 =?us-ascii?Q?o6tqWu6v0SkGm4fYOWa7+tX09c8jDGhBpsJSGArsDdhM11mKaUrn2zxGhSv3?=
 =?us-ascii?Q?rTafmCjv6Fpo2ZrTRLLxORugjM1AlkaVG4iB65gGzIPjywnWZSgATXXUQFUT?=
 =?us-ascii?Q?k+MT/CsEQsZQVoyaUKJK6qYrEbI9tTAgpg1W+b2TyRexbkea1e3yIfcN7R9D?=
 =?us-ascii?Q?cNsseMKmZXN/pxgMlwbRKigvX+El4lg/T1RBvt92GXlgnoNzPm7CKw/AQIHz?=
 =?us-ascii?Q?ja6nVDhqPkSPr8c8EIP9LO538hTNjaxoKfnGZ4j/CyCy7kBkU48tukZkAiHU?=
 =?us-ascii?Q?WZqGqOdMBSxmFmLquQzM2Da6UKh/ZX51pEJA7nCSYAZKq9sfS1bFQU88z7i5?=
 =?us-ascii?Q?TrynFQMT+7srVQOVS4m2sVsPsPTBx+Oyou7jSF02b8se3o4V37c1m6SRA4wG?=
 =?us-ascii?Q?WqUMGmtWQIvkSZEk3syR+Zo9oK8qvMPocIp9Bj+gHSVMkzKD26y4P/avmDlu?=
 =?us-ascii?Q?YeO70prN4FAH878wnuzN3xmctjQPClshI8Z8j09Ptb6kp+yDjHoK9q1Hnt14?=
 =?us-ascii?Q?34L/klMGTdtQ8UbtkuQup/DJrY4i07E8vnKriR0bUEbViov/jpSKs6V9ogTh?=
 =?us-ascii?Q?UzhcMl8wGdEVu7Txu4pIzQoVqRMB/GmisYymVQMyFhYx5n3DbboBMnKzAmj4?=
 =?us-ascii?Q?92toBLRN+OI+d0kDPPRajwdlKwH+HocmZfga4Pctm91kzWkRkMiPH12ByVAc?=
 =?us-ascii?Q?ev5rHKK9ZUB0KAyrBoQi3mwM6iSna2VHQ1HancgvXX+zxDe428uatZEbBcKE?=
 =?us-ascii?Q?QZz4lDMyhYmBwjDAVq+m5URjETKSsQPFnBvKO8ORbWwH8iMQobc3r/2SdMF4?=
 =?us-ascii?Q?l2s+egUHgq8HHZfmIewQTk1QxVyzzcCYlUJlpiIYwVWzsL2dm2q5nZW2Sn6+?=
 =?us-ascii?Q?uRg/ihjEby99bPFotjZ2baAI6v/i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5xRaOL+o0tacnsjWZWoVHg/iYYrXwFXba1X/RqOL9n2vdoKf4oy3hFwDQAKE?=
 =?us-ascii?Q?N96EHlZY/L+2sL5wGAdys5aIWPjVqaZ2nZP9HLxwujrUr/x0gMV1tOprH3zK?=
 =?us-ascii?Q?gkCMvoXHHUZ7q1e3cjQr25GMdY9DXcc0NC+YXZAeGf/jxZV5gsJ64G3eOO09?=
 =?us-ascii?Q?FgeL8vdrlgDJhX9d1Z8Z2t946aVAJyoGjo5MHU7t2mlnrTUOTEXf9s4OXqsZ?=
 =?us-ascii?Q?0uMEGOpvFHwq75SsBZkwNN5AxN073pW68cEaYV7NgUWI6NosYVwy9ZLAlHzh?=
 =?us-ascii?Q?4GlL5N/tEH3EeahgtxwdUP+LkASUchQ0FPAgSbn3Am+t99+ZlLDAVqXTpIn5?=
 =?us-ascii?Q?l6b6MWjLsQyVjPuUwcqu+sxZNSwhUsop+f9cR27OxASvZmEggubZB5o0ISrb?=
 =?us-ascii?Q?7CCYj3er4YDPctOs0WikCvHPIfzKQDS0EbRLUIa7Cv/PFy+f8DDQlN7foHlI?=
 =?us-ascii?Q?mwREs0rc9/wPT37A8rRW6VaJV90LEcMkkWp1Eo74qT6vAsrjQFoGr+qe6RGp?=
 =?us-ascii?Q?Hc2qG4bwyZNrRyn31CuhMy03LMGGKPWeKi2XoRFZJ59ehAmgxzOZKI3LFDQt?=
 =?us-ascii?Q?34HIXE48gJDdM6LTAA1AqWs5OSmyp5H3szFBLb386knGfBClBBX0rmoEBIY7?=
 =?us-ascii?Q?dKSrLqA8iomjv9EitFPwPU4JM9WePoMU7+o3cadxtsYKgtI/sFD8t/P38/+r?=
 =?us-ascii?Q?zBcY6zeEOGo/565A8VUqeW+EDYgYcyjdd0SAz9krCithg+sg51PxrGo/p6xr?=
 =?us-ascii?Q?sVpY4Xz14Q5ldd9GIYNhHawWD/eGKRS/Pn5OfeX2Caont7z3HhTk9ZqBxfn6?=
 =?us-ascii?Q?9EKVpstH9W0kH9v0uiMQNKgB8vawLQ99rfoqbfc5NDJW/1XhWO0Egq593Qby?=
 =?us-ascii?Q?Yg7K1toHwQM7fH/X1z20pz0IhtYkO2LK8P30srrZ2PevmDjLx4n1LgTszNaU?=
 =?us-ascii?Q?8C1GRYcrXG8VcRGedhPJe8HQJIYlOt9yU3iUYZFg0U+ZR2nak71aWSwuezDD?=
 =?us-ascii?Q?3sy1rjRlBxcKuyu8Gc4GwUZ1AFOfXZv1CwZVmqu5JElJNigwxYGjGUzB+0cf?=
 =?us-ascii?Q?MtBOt9hb9LWfgZnS2wjn/+POEbVW/RtPtSlSrt5COO2eCut3tdJxM8TLboQo?=
 =?us-ascii?Q?aIUniZqRR3fabr3Xa10E7S8Azkh2oJp205bxO56uvl26o3CTqg/3KCcGB4uq?=
 =?us-ascii?Q?scg7vhl/QvfBX4HqmstKrG1Cr/LmlhD4yBkmmiZc4GWgHPLReIoO+pH1BlOS?=
 =?us-ascii?Q?qhIr0HCOQWKezgUwR76E6iE5XNlHonghlu47eDap/zamUXkb7CxlXdPE5FNR?=
 =?us-ascii?Q?+KaPDtj+p0I6pVcJPXADpq01QNvx9SLckQlxYP/Ujs4Nx1u/w9RwWwKw3Htz?=
 =?us-ascii?Q?OXs8nLfuS2fT7CGnVivU3v4xkS5g/yed++ywQMQMroM/uA2uHvbBAAznp1EG?=
 =?us-ascii?Q?JNE6Ex7/FdIaWTLVidzi8KM3tskZBuNFPoN9/mzaIRKJBeNg9/eueKo3b3ht?=
 =?us-ascii?Q?gKQE0Y9Qs0L60TeJbXSdPXyj8AqTXEu5bEfqYlSU/01nX4DedNo8BH8Li19D?=
 =?us-ascii?Q?D0yXYGCSpiuKDUdzhmYA8oQbBVny0aZFLpx6x55gfjeUHFjQbjP9xOd1XG9s?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VCmIWhtpxpZe/DsGIXzap7A7VV3ubwzTCzHghiB5qpN3aiN6ZxJklUd7eYen/ON+/9g4eWCRIObQH3wUm756FfAFfRYp3bkMu4fh49peXBkn3Wr8/yhrGXJ5RF5dBKdHp5iXuH3ErwRPRfbn2nXLch/+OyUteLb49AmO+P/n2S2K3DEM7b1DHP6b3Ah+DpoMxiRAOao1OCAriZ4btvLbtsIqpOGyHX2KvghyXTLNrBAkV/mYN2zmWkC32jzRnfPlYOoD72Z0oGH4TKu1X0pQmVQBkRuKVIW8SjbovYYGOmdguAKS02G1OsB0xKM5EJOOpUu6nqeclmIReqvFkxjMzNihU4OnQhtgl+PoICfNNSui12JGEmk2/t/xsOpIhCpRD36u/4IDVHSU7d5SAk8NvtrMkic37ZhPjgzKNBOJ0cN1AgTW99JJADAsu1o4+CY4Q/LijGoTQkS6s6qZnW3YIebi5qwKyQmijGaz76cfIJTzDuyN3DqNSIhope2A+1Hk6e447QQ3Z0NMnJcpMkvUEHE2pX/gMa0CmwO4QqgnCrAYgbwHWHNrEmtKH9cgFixhs+mhrEzhCONGIenSzYXZuR0TMKW58mY6D7+A0I2ogps=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfccb49-5de6-4030-ddce-08dd2b26a341
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 12:11:50.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqQYAz1+fKRv/hqFPXMZVWkGdkbbEWLFOBHIGKIE2OfOlXkF0mdtQUthdwxFIe06L36NoXV/CH5kFf/ZleNSKWQlJ/i5u/N/YgRjP/VIyZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020106
X-Proofpoint-GUID: TthUL_ey0TavEYFS8IUrqYCJvnQoYwC_
X-Proofpoint-ORIG-GUID: TthUL_ey0TavEYFS8IUrqYCJvnQoYwC_

Now that we have removed the one user of mmap_region() outside of mm, make
it internal and add it to vma.c so it can be userland tested.

This ensures that all external memory mappings are performed using the
appropriate interfaces and allows us to modify memory mapping logic as we
see fit.

Additionally expand test stubs to allow for the mmap_region() code to
compile and be userland testable.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/mm.h               |  3 --
 mm/mmap.c                        | 59 -----------------------------
 mm/vma.c                         | 61 +++++++++++++++++++++++++++++-
 mm/vma.h                         |  2 +-
 tools/testing/vma/vma_internal.h | 65 ++++++++++++++++++++++++++++++++
 5 files changed, 126 insertions(+), 64 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6939c2a8d90f..1a11f9df5c2d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3446,9 +3446,6 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
 }
 
-extern unsigned long mmap_region(struct file *file, unsigned long addr,
-	unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-	struct list_head *uf);
 extern unsigned long do_mmap(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot, unsigned long flags,
 	vm_flags_t vm_flags, unsigned long pgoff, unsigned long *populate,
diff --git a/mm/mmap.c b/mm/mmap.c
index 7fdc4207fe98..7aa36216ecc0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1072,65 +1072,6 @@ int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
 	return do_vmi_munmap(&vmi, mm, start, len, uf, false);
 }
 
-/**
- * mmap_region() - Actually perform the userland mapping of a VMA into
- * current->mm with known, aligned and overflow-checked @addr and @len, and
- * correctly determined VMA flags @vm_flags and page offset @pgoff.
- *
- * This is an internal memory management function, and should not be used
- * directly.
- *
- * The caller must write-lock current->mm->mmap_lock.
- *
- * @file: If a file-backed mapping, a pointer to the struct file describing the
- * file to be mapped, otherwise NULL.
- * @addr: The page-aligned address at which to perform the mapping.
- * @len: The page-aligned, non-zero, length of the mapping.
- * @vm_flags: The VMA flags which should be applied to the mapping.
- * @pgoff: If @file is specified, the page offset into the file, if not then
- * the virtual page offset in memory of the anonymous mapping.
- * @uf: Optionally, a pointer to a list head used for tracking userfaultfd unmap
- * events.
- *
- * Returns: Either an error, or the address at which the requested mapping has
- * been performed.
- */
-unsigned long mmap_region(struct file *file, unsigned long addr,
-			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-			  struct list_head *uf)
-{
-	unsigned long ret;
-	bool writable_file_mapping = false;
-
-	mmap_assert_write_locked(current->mm);
-
-	/* Check to see if MDWE is applicable. */
-	if (map_deny_write_exec(vm_flags, vm_flags))
-		return -EACCES;
-
-	/* Allow architectures to sanity-check the vm_flags. */
-	if (!arch_validate_flags(vm_flags))
-		return -EINVAL;
-
-	/* Map writable and ensure this isn't a sealed memfd. */
-	if (file && is_shared_maywrite(vm_flags)) {
-		int error = mapping_map_writable(file->f_mapping);
-
-		if (error)
-			return error;
-		writable_file_mapping = true;
-	}
-
-	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
-
-	/* Clear our write mapping regardless of error. */
-	if (writable_file_mapping)
-		mapping_unmap_writable(file->f_mapping);
-
-	validate_mm(current->mm);
-	return ret;
-}
-
 int vm_munmap(unsigned long start, size_t len)
 {
 	return __vm_munmap(start, len, false);
diff --git a/mm/vma.c b/mm/vma.c
index e37eb384d118..4cf2acc378ba 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2427,7 +2427,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	vma_set_page_prot(vma);
 }
 
-unsigned long __mmap_region(struct file *file, unsigned long addr,
+static unsigned long __mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
 		struct list_head *uf)
 {
@@ -2479,6 +2479,65 @@ unsigned long __mmap_region(struct file *file, unsigned long addr,
 	return error;
 }
 
+/**
+ * mmap_region() - Actually perform the userland mapping of a VMA into
+ * current->mm with known, aligned and overflow-checked @addr and @len, and
+ * correctly determined VMA flags @vm_flags and page offset @pgoff.
+ *
+ * This is an internal memory management function, and should not be used
+ * directly.
+ *
+ * The caller must write-lock current->mm->mmap_lock.
+ *
+ * @file: If a file-backed mapping, a pointer to the struct file describing the
+ * file to be mapped, otherwise NULL.
+ * @addr: The page-aligned address at which to perform the mapping.
+ * @len: The page-aligned, non-zero, length of the mapping.
+ * @vm_flags: The VMA flags which should be applied to the mapping.
+ * @pgoff: If @file is specified, the page offset into the file, if not then
+ * the virtual page offset in memory of the anonymous mapping.
+ * @uf: Optionally, a pointer to a list head used for tracking userfaultfd unmap
+ * events.
+ *
+ * Returns: Either an error, or the address at which the requested mapping has
+ * been performed.
+ */
+unsigned long mmap_region(struct file *file, unsigned long addr,
+			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
+			  struct list_head *uf)
+{
+	unsigned long ret;
+	bool writable_file_mapping = false;
+
+	mmap_assert_write_locked(current->mm);
+
+	/* Check to see if MDWE is applicable. */
+	if (map_deny_write_exec(vm_flags, vm_flags))
+		return -EACCES;
+
+	/* Allow architectures to sanity-check the vm_flags. */
+	if (!arch_validate_flags(vm_flags))
+		return -EINVAL;
+
+	/* Map writable and ensure this isn't a sealed memfd. */
+	if (file && is_shared_maywrite(vm_flags)) {
+		int error = mapping_map_writable(file->f_mapping);
+
+		if (error)
+			return error;
+		writable_file_mapping = true;
+	}
+
+	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
+
+	/* Clear our write mapping regardless of error. */
+	if (writable_file_mapping)
+		mapping_unmap_writable(file->f_mapping);
+
+	validate_mm(current->mm);
+	return ret;
+}
+
 /*
  * do_brk_flags() - Increase the brk vma if the flags match.
  * @vmi: The vma iterator
diff --git a/mm/vma.h b/mm/vma.h
index d6803626151d..41bb52594ffd 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -245,7 +245,7 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
 int mm_take_all_locks(struct mm_struct *mm);
 void mm_drop_all_locks(struct mm_struct *mm);
 
-unsigned long __mmap_region(struct file *file, unsigned long addr,
+unsigned long mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
 		struct list_head *uf);
 
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index c7c580ec9a2d..49a85ce0d45a 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -41,6 +41,8 @@ extern unsigned long dac_mmap_min_addr;
 #define VM_BUG_ON(_expr) (BUG_ON(_expr))
 #define VM_BUG_ON_VMA(_expr, _vma) (BUG_ON(_expr))
 
+#define MMF_HAS_MDWE	28
+
 #define VM_NONE		0x00000000
 #define VM_READ		0x00000001
 #define VM_WRITE	0x00000002
@@ -222,6 +224,8 @@ struct mm_struct {
 	unsigned long stack_vm;	   /* VM_STACK */
 
 	unsigned long def_flags;
+
+	unsigned long flags; /* Must use atomic bitops to access */
 };
 
 struct file {
@@ -1176,4 +1180,65 @@ static inline void userfaultfd_unmap_complete(struct mm_struct *mm,
 {
 }
 
+/*
+ * Denies creating a writable executable mapping or gaining executable permissions.
+ *
+ * This denies the following:
+ *
+ *     a)      mmap(PROT_WRITE | PROT_EXEC)
+ *
+ *     b)      mmap(PROT_WRITE)
+ *             mprotect(PROT_EXEC)
+ *
+ *     c)      mmap(PROT_WRITE)
+ *             mprotect(PROT_READ)
+ *             mprotect(PROT_EXEC)
+ *
+ * But allows the following:
+ *
+ *     d)      mmap(PROT_READ | PROT_EXEC)
+ *             mmap(PROT_READ | PROT_EXEC | PROT_BTI)
+ *
+ * This is only applicable if the user has set the Memory-Deny-Write-Execute
+ * (MDWE) protection mask for the current process.
+ *
+ * @old specifies the VMA flags the VMA originally possessed, and @new the ones
+ * we propose to set.
+ *
+ * Return: false if proposed change is OK, true if not ok and should be denied.
+ */
+static inline bool map_deny_write_exec(unsigned long old, unsigned long new)
+{
+	/* If MDWE is disabled, we have nothing to deny. */
+	if (!test_bit(MMF_HAS_MDWE, &current->mm->flags))
+		return false;
+
+	/* If the new VMA is not executable, we have nothing to deny. */
+	if (!(new & VM_EXEC))
+		return false;
+
+	/* Under MDWE we do not accept newly writably executable VMAs... */
+	if (new & VM_WRITE)
+		return true;
+
+	/* ...nor previously non-executable VMAs becoming executable. */
+	if (!(old & VM_EXEC))
+		return true;
+
+	return false;
+}
+
+static inline int mapping_map_writable(struct address_space *mapping)
+{
+	int c = atomic_read(&mapping->i_mmap_writable);
+
+	/* Derived from the raw_atomic_inc_unless_negative() implementation. */
+	do {
+		if (c < 0)
+			return -EPERM;
+	} while (!__sync_bool_compare_and_swap(&mapping->i_mmap_writable, c, c+1));
+
+	return 0;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */
-- 
2.47.1



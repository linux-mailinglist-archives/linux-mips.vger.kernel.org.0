Return-Path: <linux-mips+bounces-6973-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D19EED09
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 16:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C46164359
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 15:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C832210D8;
	Thu, 12 Dec 2024 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bx3JQlXU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XTVZuNUO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54321E0AA;
	Thu, 12 Dec 2024 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017875; cv=fail; b=Angbi2pYpLKoE7FVCbILly7l7q+x16tUw42VuYKjHp0x1FA2sPW6C20fpiSff6qClLmbAjj6NfKTvoKZ3R179waTCAjzewHdEWGbWOpYark2q/ogzz8AdzKmYcmNuZ2V55h7V+SHUFElH55HSS81ZRg50NciTIht6USMBIO8hFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017875; c=relaxed/simple;
	bh=HPF6hT1GUZgFku8OP33CnTIeFJHmxqeBCbJ8W5zvnPA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KGFbPeV0EzaPk1Tnfm3UhBAXH8HOtCkHHj5UD5S/S/Zr7djM8Yw+2M8dIiCy7IoKBgSk2jQbsBIPznxxPyCPrfg6lfGvhuF/GdC4tjDQDPg13+oOr+mv2tyGuukz1uhAXpgJdUAe26IdYaDdEP6Ta1djkLeJ2BBLOVbt5y7nHtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bx3JQlXU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XTVZuNUO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCMGnm014128;
	Thu, 12 Dec 2024 15:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=gtZ5HjoSyylorDC+
	yChK39rYsCAHJvWgIXZqRNkgITQ=; b=bx3JQlXUTLfJ6zcPGQa6X/enhLKxvpGE
	yJEaTdlxXsZ/GZaM/4Y3YQ1i7QmSEV0HssR1xfr08YZD/QJZoazX76Q5z0NYKTSp
	ncVWcEy1YbllP79wtbwVwe8k6Ylzn4PSS3QvhENITp+bMkCOH5lCoPTvvwgwTxUK
	eUuvx8ccUZIXdvm1ELpzm6i4z6Z7Sirh44Rdq12FDImxzU0Ry/T7pjOp5azZVlWL
	a3DwX4ihkut71a22SqTXQl3xZNYGs7Lqb483EG6Dys2E6EZqjvdp4Nzqjd8mWJjV
	zFfKLq5kzjRO2ULelY/1MmwscBsO20fpQiwFjOrDjIEJoBKwpmqN9w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cd9auen4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCEwPSr020564;
	Thu, 12 Dec 2024 15:37:31 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctbap6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/KEIGdnFcJrvVJ1K1etxMWHNTImgXM+1VxRcAOXgUlMoE1lbxRcLtXMVSGOgE1DkPbkzYL6KOafro4xB+OEwK+vureE8HOFvOUYxDZm/iNVbdYJN07RkoA5BN3LHxlSg1b4jr9yrd627nUS3wmUnLEokWi/w1QODz1pUgtFiS1Lxkug/KiXtNtOzqIf3l2MWHbbF3ZDQH5tQFaEMDMG/10pDXdY0yntrB1C35Od/nGmiEB/lhLq5j64zlkLQ/wG0kbf6wAs/KHhIJGZ/yLQrzyo6fSWDfOp/MdsZ3t09G6gKO7c6zpeuMkdzrkzT8Aw5wDVVUmTWOgmTUOAgkGb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtZ5HjoSyylorDC+yChK39rYsCAHJvWgIXZqRNkgITQ=;
 b=YO72QGZtQDxk9wQ+EEx/uKQP1ZJEVMMw8veNRdWcYli8lBtr5mRQOk0w/CmhaDMvhgqNOWgPQFouVzOJ91/96Ko44d/sSEKzkEb/q+udEXDiB4B/hSr6Nbj0jwk01IaUOj0lGW+gFeMPvdt8xZENmKXD73z7fey8rHiKinJA4zNeNd7lNcJjRMRk0L0Xc3iIsQlMrx6jcjASRuEGomVGpmLO+dntEAq73Y874B4B23TiOI61u/fRsEtUPkk/e8tE66ariKtAG/0TrojjWJI1vlNGKeN0sAZHw3YxgdGlZnRjp9vQB2lCiRWc80teaGV4aHX5WlalLFkxyOkb0doWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtZ5HjoSyylorDC+yChK39rYsCAHJvWgIXZqRNkgITQ=;
 b=XTVZuNUOwEJ8mMhameCQEJK+h/KBjozsueLFX9/fOeHESWZNQqxHc580CJwJ62JXiR7UdH9Esh7c6i/SijziN2YPOU0I4UZ3tah8258UdAi7iKsg6tCqhJwOaANR0gvM8aTIA2uUuUE/Sd5nx9fzvZrB3HZ3QA6JZ8Bk6yzNzz4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB5804.namprd10.prod.outlook.com (2603:10b6:a03:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 15:37:22 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 15:37:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [RFC PATCH 0/2] mm: update mips to use do_mmap(), make mmap_region() internal
Date: Thu, 12 Dec 2024 15:36:45 +0000
Message-ID: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecd636a-30ae-4dcb-e384-08dd1ac2decc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nEZaWEZQmAFbIFl13Zrk/Fr7340/Khmku/2DQT31muFheA00W8gstmPzb8BU?=
 =?us-ascii?Q?QS78egjmK+NWSXCCBW5gJT4iU3rAK18ZcJOL3mdY1KlXCH6ESQrtwmaz/dVk?=
 =?us-ascii?Q?wy/JnTqpZzeqVH8arPOpYxp04SEchPvOjSMAmriIVDOtsXHa3Q4GzBvsK4Dc?=
 =?us-ascii?Q?qDW/0bETL+ohRV/bw/lvr9KIR5nPQvDTFHQf1qwWmrWYaYMkYVPE4g3mLqWQ?=
 =?us-ascii?Q?Nu0ufcKXGTVd2a34Bb8UjhEDLwcBep0wQIjGZNOMSMMNlix4ojohgVEOmWX0?=
 =?us-ascii?Q?fayGBAv4rDQBitv6Su4LmYD1vV1Ozwv9hR0XwL6UlhzgftMSxYx0qToJMR0J?=
 =?us-ascii?Q?vMI0c1hdq/68Eidukdozg0Da2c1HhFQcQ2Lk0bkNzPFLv8bXy34z10Tfji50?=
 =?us-ascii?Q?RxkKi2RBrQ4+jgrZ250/UH5B0a/XuZ21doOiGFH5Ng0IbUA002FtCPlRRYYm?=
 =?us-ascii?Q?DtkmBGwaXGA7FZztYyww8IuQby0iuhfX4Bu+ceXake6QFAjJfiHFiIfK425l?=
 =?us-ascii?Q?jGqleul65j0d3m12+9ONum0FkQ5n3RyJLuIDsPBOPAcWDkJlcXrmoEf4zKO3?=
 =?us-ascii?Q?8dk4dh1+70k4mP1iMmjHG2dpzEK6nQLhwFDTOiqsZ0lUnY3QKkKQqC7C4GZN?=
 =?us-ascii?Q?e2XSDzXpiZl7QUDJ+xkaQmr6lJ8tRIwJR546zYM4sjQ8xz3RP3AqDr9Ay2qJ?=
 =?us-ascii?Q?KHpi94sui+Q4zKiOAIAHHGEcp5YWfSp9bT6GPr8akBVjqm6jXj1e83SXqheG?=
 =?us-ascii?Q?bQOYpVnUVavHOjR6tOv7kAWtWRwq7n+qRa0lvav8KM54XICLVnIopNof41yH?=
 =?us-ascii?Q?a55E7WOIFm6gOZDI8ozb6lhWXmQX5+pLlD/Mzath2/AB25vrsCwFNNyH0xnE?=
 =?us-ascii?Q?SPLxFc4a4I/DL5SMC56Nlj9sBPFVSHuXCFhaXdLwfvLzKheY/QmX7qZRDYpD?=
 =?us-ascii?Q?3Y4NELopaISb9/B5cZZFIc8UXP7qG07t2vJp1r+DZrnrVAqOx4NoNt/tOCSs?=
 =?us-ascii?Q?MR/Z2Qjrc+BNZuGVG2Del5Bdn/hAt9nYUxF+JWq6o++St2VGimLLrsguvL0V?=
 =?us-ascii?Q?ELpwcts2mzcBmtfw8obWnAPQrjfoOqNN+sjrdSO/AcckhLXVo0JDp/iP/pCR?=
 =?us-ascii?Q?N+ZNyq3H40wE1AI8MBlIJktdzKx9NmqP1Bexai9IycMs5KYm/Q3HHqLQcKUq?=
 =?us-ascii?Q?KbIhO830dI27crv6vUEJ8fVofFCH1GfN4en8Ga2bF1fFIaa9TTjpqF6AZDBy?=
 =?us-ascii?Q?CLXiRu2AYIqYgC+BGZENJfPaQBS4sIJXZWQXo55bJfAPAU0AYHLPkkc1w7sT?=
 =?us-ascii?Q?CjvWhSZasYIDkZeyFUHhI2Y/G4CQpqqv+JLKuE4izo1k5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ztxUgGmgUxaGqZx6+o6wGBAzulhAw8b+QO8LZxCFFN5UPQbs4gxlMUeuX3b7?=
 =?us-ascii?Q?PbB5/lPJkBF4oO0vznHVwWKMkqyG2oPb/Jq7F4bawUQ6ii9t9SJ1vMNBoSzD?=
 =?us-ascii?Q?ZAqAqsCk0tm3uVB7xFbOXLNpYuxRVd++zKJ2g+yIsnFgZjg4as0E9/TS5W+g?=
 =?us-ascii?Q?JeQIyJmk0DMxEhHkY2t4xGL1SzlYSLz8T0b4sOb5t+BmOCoyAB0V85s7ANaC?=
 =?us-ascii?Q?YaY7HI+DwR/aRpkqOMtHWy2QE+Obu8EZLxhWIjbUrwY06orUKzMjBZ7rLibP?=
 =?us-ascii?Q?3Zc992SF19h5tplADw+EUhSGAhpBjhmV6faM7HTxjJz8Tf+3J19SHxjN8udb?=
 =?us-ascii?Q?zjsdaaZXCZeb6Nuqrki1BWCbAXDhWftYSjRvxu71uMCpO62RztvDuKMqbOLN?=
 =?us-ascii?Q?C2wrVpszo2hshAXwwbPMwN8h39S2HJyrsI1fx9sulVSvQ2wwmCtU7xFDggGv?=
 =?us-ascii?Q?7QYcEAlPyKM47fRXc67pE20HIrREe8YKu7T7T9VWo80L1CTIl5HrJIl5AbLh?=
 =?us-ascii?Q?Wdqcpo0vPHUeh8oTo+to8EaMcsni9u4/tgd5mx6AiRYXJLux+SFNZo3qGmoT?=
 =?us-ascii?Q?Ku5krTesyrbr2XFijQK4q6vUkicF8R3PpmM4zOPLC6EnqxJMpm0na6OUBX9i?=
 =?us-ascii?Q?PkHqgWj9GlfiuK4EMoiCkXgvkIkjW1Hl1oUnAa1QNP87W5hD24pXaVdkFhdK?=
 =?us-ascii?Q?95vnu8FRj4xc+/hcACprOwsl30GvdqUIGWZUtFQr63ZJPn4NGIJ9FJdGAWM3?=
 =?us-ascii?Q?IdkZP1hNrC3ROPaYMa5lwATWKFxVa52E2xP07XWXumCO9I+QONYQ+Mjn0djL?=
 =?us-ascii?Q?BqzFmyew6KAuaHFnJmdh+JYBLyxJFKvRIhWPg2furlK/xgWbRdyZDQI5QEoJ?=
 =?us-ascii?Q?hXXfc+oIo8G7oZvU27xssqugpxukBqTKWJjXDj/G+5GqLtDCystrnJbx1qEY?=
 =?us-ascii?Q?/Flshp41e8BR59BT0jkYpyHvjB9+lUiXLBl4oiBaMOmkf2FSedIK5xm4MVJi?=
 =?us-ascii?Q?F/afS3fXEqWZLdbqISzvT7MzUkCbGmC8V5hexilGdYYBYqKf27ChilQOWE0Z?=
 =?us-ascii?Q?jSrl0YthGtBDtlMLM6BLTvnTBWcvTY+IHuidJSVTfEsHmC/JgovjVwU81G0t?=
 =?us-ascii?Q?DgGMqniOkCBe58Zc8WF0Ad4NtSp/2UBHC7iEW2TJq/gQeJXzSamzIPk25+0a?=
 =?us-ascii?Q?3Md31CBZYu+HK8bmUJcQr0ZA9wl7p1Dexufg8MKQDDaxajIGXJnO6FmCjVml?=
 =?us-ascii?Q?8+RELKZjSZgIzIa1/tI0qc70nbOwFESzZmtVp3h04vmcpXjlWx8vdsu9+Y6u?=
 =?us-ascii?Q?29wK6QrleF+JA3iwse9EOnXJA0SKXztv3g+NX4jKf38G9pPbuXcC8cYumIyw?=
 =?us-ascii?Q?6+iz7Q3eKzb6s3/svfGiuhfY3CPKMmCDqdZwAvSiunxfq4Bjc0SLzyVHlt+y?=
 =?us-ascii?Q?TL7DtXxWagWouDbUlyaFn1ZS7P11hX3IGF7IVZttU3Sa8Q7Faj69Ynpg+AQ2?=
 =?us-ascii?Q?ptiXWSU4pc+iz9tJ9M6fPDwlKOqHy7e6u+UAHyKN8xU+aTxE3jJCJ2X0g0M5?=
 =?us-ascii?Q?1nFhxVCAICxM5IYcXZfA6AOlnBIBZXnyUTSMy/buzzDnDYqEf9jCQDUjAXQN?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A/zfcJ5uiGkeaTq9bmRedL7X7pB3sBZVIBzfyWMIEwliOSNYtor4s7H/zhZArhcRnIIPJSDF+KS5HrC3/tCkfCUXKtFv4Lk3Qop8zhRbOucIcst+mBKO0hesDMfKOOm1UGgDxjXZFzQj0EEnqVDt6+uZ+Ov3WF3b07x6KzlMBUmi+FurG0KrbgjT/Ti3jSWHmXFmK0nftUBABL8ApP/Vuhw1LxsuFguwRoJ7ucDG2c9e1lBkPpKu7Sp+i+CtH3NVMmIBmdDMptyX/egGkn5Pl+wX47KuzoNYLEOjzr9Vyksf31/u/cWD8vfyO21qjCJZ67KbpOdxzh21g4y5x8z5oZcZ/4QKkHKNlcqIGd31HQxvZPlcrFfh7osdaoSj5v3Jt4mwcKjUVXq+XidVPb00/vkjh6qn6hqZ2il4lF3WlVK7gjaCHCUu91ezwB1F/mGdfg+w5kqsgbSthWU0NdrgslvzQYuv2HUfkrXXyx7K3iDWB6XrQRRuGMG9Vk0QqgrKSIikuMkND7snbbmjRZmbi8dvvjZvMB0AHtgHIWjgY7L2Nh96PGFToKg2fqP14IlZ/MaPEZhfIeNmk7xFfdahpk9YVaqieM/Lu2cU+tNZuVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecd636a-30ae-4dcb-e384-08dd1ac2decc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:37:22.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIDgR5L1ZnAebP/ttHl/3Iruuq2ehCA0gVC3p1c5dEHiY2i2BDpiN3xiYi5KbVMLCt2JxUBn5VyGTxNQdHm41nnC1ZzQle+4crWW9unJbr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120113
X-Proofpoint-GUID: XpdUV9ORVYouFlervwXY2JWHPQMSF0nj
X-Proofpoint-ORIG-GUID: XpdUV9ORVYouFlervwXY2JWHPQMSF0nj

Currently the only user of mmap_region() outside of the memory management
code is the MIPS VDSO implementation.

This uses mmap_region() to map a 'delay slot emulation page' at the top of
the stack which is read-only and executable.

This mapping requires that an already-acquired mmap write lock is utilised
and that uffd and populate logic is ignored. This rules out vm_mmap(),
however do_mmap() fits the bill.

Adapt this code to use do_mmap() and then once done, make mmap_region()
internal and userland testable, and avoid any other uses of mmap_region(),
which is absolutely and strictly an internal mm function which bypasses a
great number of checks and logic.

REVIEWERS NOTES:

Thomas - I lack the hardware or set up to test this beyond a simple
cross-compilation test, so I need some input from you MIPS guys as to
whether this is workable.

I've therefore sent this as an RFC so we can be sure this is suitable!
Please could you check to make sure this change is OK and I haven't missed
anything?

Thanks!

Lorenzo Stoakes (2):
  mips: vdso: prefer do_mmap() to mmap_region()
  mm: make mmap_region() internal

 arch/mips/kernel/vdso.c          | 10 +++--
 include/linux/mm.h               |  3 --
 mm/mmap.c                        | 34 -----------------
 mm/vma.c                         | 36 +++++++++++++++++-
 mm/vma.h                         |  6 +--
 tools/testing/vma/vma_internal.h | 65 ++++++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+), 45 deletions(-)

--
2.47.1


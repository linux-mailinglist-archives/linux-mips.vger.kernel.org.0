Return-Path: <linux-mips+bounces-6972-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68C9EED05
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 16:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253101885FDE
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 15:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E34E21B8E1;
	Thu, 12 Dec 2024 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B9ZGeBYQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O5nl/G4h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21474217F34;
	Thu, 12 Dec 2024 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017872; cv=fail; b=KFLRO+eq5LV+ga4H5zqVwurVcpt90uCo408dDJf2JSJ/W5Frkd2QAaQ6zFHpNDQKAmSZ8VaQ/aXQdmPwEZ7Z97rxQ4Y1neEYS2kv4IhpTEvamIDSml04spLg/A40U9Pf5JUGf5i0NsNlTF9PMGcsobQTYA8H9cLIjNky+iinSk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017872; c=relaxed/simple;
	bh=qHNz9b/eSFpH8qEyVpzIeUYLQPnOLOV51BbFtVT9n/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NdqYrBJUqrno6TEvVYCFiaDXImHCtk5gYPCaYhk7/wW5grQHOqGrSqIpUJBzYQg6TLh0AEWp+oTUNg3oUO3+cVelBPcKS0rZqc28v8692Bjwa/N/f6tbeeEtgVw/C19HbH73xN4kqPpZESqC/XRwIPdJZtDaLkUen+cqfKYbBgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B9ZGeBYQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O5nl/G4h; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCWuUB021240;
	Thu, 12 Dec 2024 15:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=; b=
	B9ZGeBYQ52FMV6+8w3ZboVm9zTmi4ewniviXP1xWwEp2vKhSmFyNq/ghUAS5Fw2i
	Rc1RfUiv6aQNMe3J79vnpV3olSm+7en/QaB5aPRBGs44BepqpwysWcbaEOUSG+sO
	scagjPX2byCPvRuonn8vQELp84mt3b91s+DaECSUzRn78fPMCyuSD1fIlYhBMF0C
	/fqmmnkf8dafaDAFNfeF2hMCeeBHqfw4ra6KIc8H+Hr3LUrkpoNVhioUI682B0w/
	Sk2mWTyiMoWiaeGsWa5Cahba4Bma3yxiI5tNOzXSBDe8uMgJfaVBM/brcIv4ixVb
	aij6xu7UgDgy90T1ZJf57g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce89b7n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCEwPSw020564;
	Thu, 12 Dec 2024 15:37:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctbap6a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWhF8gmf+rWIxDflVQXbUFBeZpoxMhpmZ7JY5FjPjVwWpjEygJrLSeUs5dAhYPlrYMQsLf1/lAmo7xN68kfczXRzrsrx+IgpEPTepv38QSRF/5BncivNJOm9/n8LPKlJ42dw1ALeF8hSae98hCFS+LBKx3atMad5bv7sic1TgsX6OjCPSQWKOLRfUVz1wch0/6r+7/pOcJ+ohMBoZErOpItFi+PLXtSkn9hHbZ5d79pXjEFXSLOr/wZHNqLOYR4i3cgK8ZYOhCrRb1YLFVvJ2tFtY1qmCxL9EO7Z/VOtF5CiBH5sDp0iMQbp5cq+Dmt2cpzmnQvUnjMV6ASn8xx14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=;
 b=sUdbOhnGnrDHoPFtiqjVgma277XGv5rPVZdEvI3Coc0a5fPG2HFggsSHD1qVfjFGd32ZEFMrdJjlwoTYdud3ZvaZ10dTBpWnyl2puW2UzTJtVCkTC7YcFL/FL1wyow5de00jjaFPIns+b9Nf2+zwj8HPO7WdfJmQYCL+KiHeoyWFvvrko8IdkRwhuMpf/I1Bjoh/B0xXitzBxEa0iSJcTMHlWgYdV1gy+t+PQuwZ1wf9CnAyM5BVWxuCfJLBmyQKLSlXtvS/VssMxorURA7kEfExzsOuCNjxLY74ACmkI1AlrUDSPYan49HZGCBHTQeF3GZLyE3JOSRN/KDELC8nPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPMwFte6ft3Ci0McZVbfCvwGByLKCsXDAFOmeVJDhmU=;
 b=O5nl/G4hZFlWV4SlrmEBEOiQq3EKF+EZZZO/2vFM3O9jB8MqqouK5y8/VY6TiVCZ9UWkadtGd6XOdZtZzUsygbS/t62k3SZw7TotMhydZvb1PE3afFrwydigxjmIe65u+pUNifLleGqpFwW+QUWr/+sWGPHQ7tftAu3ZZxswiO0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB5804.namprd10.prod.outlook.com (2603:10b6:a03:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 15:37:25 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 15:37:25 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [RFC PATCH 1/2] mips: vdso: prefer do_mmap() to mmap_region()
Date: Thu, 12 Dec 2024 15:36:46 +0000
Message-ID: <8f409e14df19bc722ad77e15ce03a95be9f829af.1734017293.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::33) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: f099a0a0-3463-4a5f-50e0-08dd1ac2e0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bGTvdEdIDNqQYi41FUL4ImN96m4IQgoS9QMYXjAOgQc6h3CaKejL6nDInxwv?=
 =?us-ascii?Q?onTagyckJ/BW1QQDMLHpGtSheEFVCitfUh3mli3TBlflF7dyJ0gkpJPcvb4d?=
 =?us-ascii?Q?NNI/dWeRQqSLEhGqH4L7iaKhWL9pVRtAVwPV8eGQD5L7q6y4eWIQa9tqKpvt?=
 =?us-ascii?Q?8fig6UxDgO5qoATK3c8R+qCXAI1+qcTlD1OFrnJGdZFH4n92StUUlD+KTUlK?=
 =?us-ascii?Q?FYO9jSQItbaCziPapRPzdmk1uwzPBr9TnJIbdmGnA0uoM9ywz+IwEJJVYrzu?=
 =?us-ascii?Q?DUX5uPUXFvh02tkTTsa9/4ss+TW8UxYyTXj0ywPrHPZeNK8TnK1fuN3cbOdT?=
 =?us-ascii?Q?uj4j08rXiOZZCG1/21j8e2Ki7pnJdEtxutypxIMwFuLELxFsMMmC6xkWI4Yd?=
 =?us-ascii?Q?dzDw6+zZv44j4VVY6dj/y+g/z/CpO0s8RSv4O6bWPzwo0PRzRxBkZw5DbE1I?=
 =?us-ascii?Q?HdIt/GDBbldBDpVavvQDWc1J4puTo0ZiC76TONIzRQQxACX0ymvvhODjfQ1E?=
 =?us-ascii?Q?20wbWprayb5JDlwahR2Tyn1EryZmffP8TpFsBXbXQWDoWmqg6Dbid4chAidT?=
 =?us-ascii?Q?GwEBuPL97y/ZRulntz6uqTGWm+vOesEDUbHOYy7GkkZhiK1+RUO+ng/M5J+b?=
 =?us-ascii?Q?ZeodO2QlrOM+RlRMPm662YPAaZS5jTvl7oRwxURG/fVgVLPO66mn/+dzmqbU?=
 =?us-ascii?Q?nrEJS4FNeXgU3mdmtlcmqB3cfJGH3LhIG8/mtHELHjIyLjdU3KX5twG7bVyL?=
 =?us-ascii?Q?RHe0js8liLYeN4p8DPM+NDQ0Ffs+olRwWm6Iz2eSD6ffmVCnCYeQGBUDSx/s?=
 =?us-ascii?Q?aXvpRJZZY0tWeL/Y239hHETbCT4UDM6pSphYtQoKcmAN3DtnbpIS418fh9A+?=
 =?us-ascii?Q?JOww1qPy7i1eP0lFFiN1m/x9QDHBX+Fmt/cYDrIdczA5HRZQSX3ac5hEpxNi?=
 =?us-ascii?Q?vLrng8+uaylSFyX6i+OKX53n0EnyNW/9jqO36iOIIfek+uwHuBJHEKCfANK+?=
 =?us-ascii?Q?ZIDzecGg5bWJLAT0amOhTsRueXyeFAYxv7kJv6xQxQZSPFg8XRmSOCymwKnK?=
 =?us-ascii?Q?HLiq8z32UnP6TCQUYbwLE809rPB0ZP9QDigQyiW1SIkAnu/V7kBmJ21qQlG2?=
 =?us-ascii?Q?EezTZA/APC4oDYqiYiqcNOQ6pO6x8EPjx+/X5q4EOKuFB8FTNgDNqVXXeZc1?=
 =?us-ascii?Q?4cQeEHOupuOoLaTiGrbuHVsKx6H9I2pUDgXFQfzdqu0o7Ykzdm6iZk4Fnzbf?=
 =?us-ascii?Q?K5giOJMgia00mt35MjUYwuKvMG58IJloxb3B69cjTbf/dqbJw2btLL/0ShKa?=
 =?us-ascii?Q?zfvdc+TQu8GLa6qkGuOnCsiQpY5UyJr3FkPEjwCpRkzlDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RLRQDns1jM5NOMCDnwN9vbIAa4uQeIzJe9au28S+1iogKa+MKUCtZQzLvuG2?=
 =?us-ascii?Q?xPFE2An+YhgDimKredx5yyO10yx+XSDhMx4qYBqeGmQSwSfWZ48A5sWxuVpm?=
 =?us-ascii?Q?JwymeT/qrkH3bST6bzuHZFD9dmPRJoIg9xt/kfRjMnVyxeMDqc5Jfq0nt2V8?=
 =?us-ascii?Q?rFzrQmEBvJ0T0EQ+umlVBLCxK2Gr/pQN3rZ8wXtEny2H8CgTBTok5XsPve94?=
 =?us-ascii?Q?QCbuvMUPbw1FnLjC4HAGR7OodrZZaxg1iagw3voZwA+hPUooBfmzTTxKPrjE?=
 =?us-ascii?Q?0itQXGd6NtrV39PLTji7rBDfHiimoAMCIRKxM1g1fu2MUBFmeGa4XWIPTM8S?=
 =?us-ascii?Q?MP8yC3B+jCpDipYeUkH304xQ0s0w1TFhcuGH4gecm7KVNNsoHUvOFiab9XEo?=
 =?us-ascii?Q?5lc1u7VCvk0UbUIYrFMDE5UClR7g9G4KQxezNJvBedzcfoNFCj+gx1UaMmlU?=
 =?us-ascii?Q?PUH1xM2/sEwgUYSWQIZDUsfFJ0HzB4JAj9qVpZaVOEwPsySQkeepQQSE4h19?=
 =?us-ascii?Q?ya/qTzeFxNv5hHkyEIYBFBUhni9GX/evqsRU2esu7sI8qV/8kHbvvQSKruoe?=
 =?us-ascii?Q?Fa7zR51dASb0QS52lELR5LYRfjmXsVRnYt1z+USxMv2Cbf1Sp1IGczO9b9iC?=
 =?us-ascii?Q?NfmXtETPUF5Fj+Umj+kW1ksVBdSasP9RDBLjOo4+ud89cH/In2+VcVQQBut2?=
 =?us-ascii?Q?fclDkCDThFtGQldBt9UtKNI8by0ODGEDKmMohOJ2ysPPql5jhudwwjBMUDOG?=
 =?us-ascii?Q?sn75+yhia6URP6r8zF4AsgrP31x77XeFzllinFPR2A0dZrdvIYb6EBDbOKpg?=
 =?us-ascii?Q?T7wddLIz1Sw0JwOz5dwlJszRHm7D2hSnxtie/u/BjxWG98gJd1S9eB/iFbIm?=
 =?us-ascii?Q?cdAvePpX8qfru6fKMVXiGmtXOU8YvE+tHSAVyEvTQFe5JeikZNHZx5iymAzG?=
 =?us-ascii?Q?zXpV+xr/v6VqaVETAJQVmF8zLBz0smpJTW/pKpwTVrViDpKU/KGJN0+60kkf?=
 =?us-ascii?Q?IVp4cjj3ty3m03VNVMqjXmTW3N5sFDsbIvR/gXu6frxFCo4UCKC/Aovn3nUH?=
 =?us-ascii?Q?iIFZrrRnNmgOI7GmUQNkYVERBVqJHVLm6rPsFVT47iJ2T2GUk1QIbrjkoihJ?=
 =?us-ascii?Q?dVieDpcDrsUPyvTw9DN+gR4g7KxRsUyA9Pqk/DO+Tb1b8NS6RwSRvghRVXIr?=
 =?us-ascii?Q?txWG12UwMY/7EYUvDKK06RaV01hhMX7OwBeShGlCrV1C+0LX7HKehuOp4Gbl?=
 =?us-ascii?Q?dM0SAcmnR85LIww350AFUqpS1hBYln3TnZ1ysSxBQyQ7Mr4WaLaNSA+62RFQ?=
 =?us-ascii?Q?unBZ0qm/Um6g/TCv64G73CLyk6NkHuj2LDcpEYxnBp8FjVNb6/ZcCwDbmJ1w?=
 =?us-ascii?Q?eie5mZCpRP/QanzTdV6GXhCK32yvAh4c/9vtcgY2Sc4ZRMTHTrELGdB5vRjy?=
 =?us-ascii?Q?zDtBSM4whko3LJg5DQhNjfFtREuc9re6Uj+RDP8v1RxAzaJkkGFGwiEAfmA5?=
 =?us-ascii?Q?HeP2cjSUAAoKWu8Z2O1H2iX/1/aEVThAQDZsfw/ZNYAlb4HDGy2ctSxN1osb?=
 =?us-ascii?Q?AFEuD4rai//rtwTS5zfb9evuXT815uza+w5ndMq+48QzNiQgD4fJujkd8y7z?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	efU9GH6eYvvN37shz0XffqawmYO6LJ1us2ZGGifxUOetXkLLVgCJeCTy24w4QJpGr6Xor46ibLH0DUHh7zhmcAEwcaES8xQqf4Q8KrUOSbW5koOFS7tQVe1M1fjCpsk/gXWBKwmAUT0c1BL8H/HlxpZpj0BMRvhEA9dLHVWpJTG96jAeMpmQHipQfP54jAoQqQLtYWZ9bWWCr18UuC4rCAIzJcs6NKq7gpmQxQVjsb8/mbpvJj4tviVSMn4H1RMkK4s3Q2MkmEjTAkVEo62cUCNJ0qiP1vSV6XFbw2+M2Z6pisow0pUxbrqIlPJf2OqYlUqM2M/pMsE4qWyLDo96+ds86QtBlqAt17MZ/lBO9o8inxZ27mfpYUzvG9O6T0k4CNEahdhEZBUL0SepUtMBocy+oPypTF36tGpgEsFLQPKwAnzHwcV9j3tRfOzeIIC3daWNLvmHPnSAzuE+yEppEvrZEWFi6po5YWyLemQx2dxr8UT1PPXapUBWvUZ1K7tgPSV74a5vJqVln4rM46U6BvhpkFWw8NBCTjIKrh677CsfwoAYaHn0y3ImVp+uNUwZAmbkbv9FPFze9x+TzGEAo4d0PqKNlLGJYyaB760H8TE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f099a0a0-3463-4a5f-50e0-08dd1ac2e0b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:37:25.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOdtv286Klh0Hrje8tn9fionBJvrnpTrKkiZ/XqcKDsBqeWEC9lF8tVuyvXioTxIYkTIeDJ4JfOZh1gspcnSbdDg+VxuXBjWi6qHINmzRpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=951 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120113
X-Proofpoint-GUID: UAEX7khZerWH3AYubgYG5VDGzfDvM-L9
X-Proofpoint-ORIG-GUID: UAEX7khZerWH3AYubgYG5VDGzfDvM-L9

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



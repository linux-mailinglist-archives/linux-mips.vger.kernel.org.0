Return-Path: <linux-mips+bounces-15102-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lSfHDi+oMGrqVwUAu9opvQ
	(envelope-from <linux-mips+bounces-15102-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 03:34:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D168B489
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 03:34:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=VOajPdiM;
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b="0S/LytQR";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15102-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15102-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439E73043F9A
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 01:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDE22BEFE5;
	Tue, 16 Jun 2026 01:34:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0C1A6803;
	Tue, 16 Jun 2026 01:34:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573676; cv=fail; b=XiyH+GFbvH004RV1re0FAmx+7pbnQcjMD1x18W/WoiMmWQRvWY8BqZ7wx5J2RJkWdb+6IxX27WN/r+pMgLV9QuJBg5TL8DzBLFjSEIgulguO5jlbDTQN5bsWk93EMiY4YWFyCjcsq8Hi9j7jZ9Wcp4SI3fw1D+/5iD/CVAcb/9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573676; c=relaxed/simple;
	bh=DTzYAJ9pstMc0/DqHjpquKXQ3QIaeWynWNE4PfqyI8w=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Dx/rtQaEm7tHlYGolesIrGC6ZOJGqvPgH+4l683mOUya5GdMBVp6SLrL8FMwnaXKnYbHn34VyxA7MsvFAosiDS98NzJiJ28qmQ3v1maNj17WpfygxWbO65vilMasEik1vtTVxtbXAd1ZD/NizyCzZ88Lr+nFKzjnnfbamaWxunc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOajPdiM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0S/LytQR; arc=fail smtp.client-ip=205.220.165.32
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FKSHWp1382880;
	Tue, 16 Jun 2026 01:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sN9Z9Kgm8GLCX/2Swq
	o9IPnxvLJq3pIlDJ++7d2mtbI=; b=VOajPdiM1Tp2MHAYSYvcwgzUNv8vFUKtH/
	rvdNm8C7BvV9cMfhGInswg5yhX4rqFnCQ2rT6PEDA/sEeD8KkummCDj/bsGXmkV2
	qYY4YrznS6jVzujwRuVyOgf6erjylCmsi5oYH7NIog5xRt3fLFqWTvINVpE7Wm62
	NXR1RoOIzigxmYdNBT3SRbceKW1e2DY3gmniP77qZNmlKlQo0s2h+dyxyAMURsDQ
	STPkAbVwfW3jZRT2ztQMaHHPz9QdcVFdUYgUjV/7ZXqHjf7xPORwHDYBKPdwnoO5
	h4pmSgUwtIG57NgaNkrIIL5Rt5i71I068Aws1Hd3w4nj3PqAkWhA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1ay3mj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 01:33:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65G1Wuff031974;
	Tue, 16 Jun 2026 01:33:57 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4etg72mfqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 01:33:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sks9fxfYsKsXb50atbvi9eR8ShufWGABrEvLcB61mvzdleotZ/cxtuP0W/WlZgLJ2WKEj1+CqM433gNb9TJdEESDdLN/w2lf6fWFY2eBOXaDBFlEU0HQGEat+iJFHhb6gbcjtlrpqVC/sukxlZa3Du1IJdqjuueBuYaANBUwGVjjmFX//cWevwrzpDHsqq2jSGgFifte5KZs1mH/svoYCBqsk4OIxYd9rn2F38FSnK8sb3ldoGG+OZeP8IGajXWgFPtdpCIIBnPQeUUsQMDW2dBr9nCfilParpyV2wWH72QwivXmfMHNKXkRXlmgqTmy/+d3SJkARx50JJQ5zHpx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN9Z9Kgm8GLCX/2Swqo9IPnxvLJq3pIlDJ++7d2mtbI=;
 b=EwTXMegj7+7n3m7FwvQVjctKv9RLZWMTT4etIkfjtLPO0RfF38d2cxE6A3hd3994FPRFiOp3nGa4Bf2HMy+qVIJKQyRr+HvR/KpoIcXz9YIrHeyUDJfswS109wXUl716pBUKZXC/KJkJtO3LSNG+XVJLSZzplrWC56l3mPYRjAkBuIB3LmqlKg/wecHzlbxRWTE5VTYffR3gnokdBN2PJ9UAscDBX5nl4aoarDiXLplNT1KyE6iIowfGPJDdFf+Ew7l1VJ04qZ0OQjtIvxriqf7KQgw2rzu1qnZeLCeo5L2Ll0RDUIwDGIZVgh/tmPUBkJCeAYbSUbkhmV829pHx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN9Z9Kgm8GLCX/2Swqo9IPnxvLJq3pIlDJ++7d2mtbI=;
 b=0S/LytQRN5K5FNM8P0Zizmc9a/BDfO+yQIGw/bDhg0XTu4EuukNhlTSaWUip1CE7vsRv8HKkGptUZgEpzPlF+MYbgIuNPBrvJY/YQpoTbFjn6iQTkoWZdkwxyghTFDT9JblJR8+v+ooCjTsr1gdxtpFn+4hlT4oWyiV32NBEAsk=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 01:33:53 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 01:33:53 +0000
To: Catalin Iacob <iacobcatalin@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
 Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller"
 <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v4 1/5] scsi: core: Remove export for
 scsi_device_from_queue()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260608-remove-pktcdvd-references-v4-1-72f88b04cc87@gmail.com>
	(Catalin Iacob's message of "Mon, 08 Jun 2026 17:29:16 +0300")
Organization: Oracle
Message-ID: <yq1y0gfuv4e.fsf@ca-mkp.ca.oracle.com>
References: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
	<20260608-remove-pktcdvd-references-v4-1-72f88b04cc87@gmail.com>
Date: Mon, 15 Jun 2026 21:33:51 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::26) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 23979d5b-ef51-457c-7e05-08decb475306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1C9L6CAF+oFezSA/TTjweWPHYoeyZEU1hE3pHhLDzQxP3NBQeW1tbGpbLR+Dzv3eDrQ7ntAReAXWXADwkPi2SinWpn9/XJEjqazHT9M3TTAQoBS8qUOoZ7BiyNrp+kRnXf5G2BS/WRTwNBMj/CIPUA/IjTKDB79R+YAmaW+PNE4CMYyDf4yJAYuf16+7PBcq6UWgen0XGxwHc5Hce5qA6KWrzReP0wgp0LWvM6bJ94b9phmdURYjdrn+S8fxCRBSJLeSStMJ8ceZmXU3XjI1rvTyQbm4qsJF3BdbVHZgh+DN3/3cCc/gTbgWN0drOETjzZLafS9lkGnEgDhpTkQIu1zqvQJJiVnfeIDth03oPj94+DID5NOm2VBoaJaKtGA+4Ur6hX1QLcjXF8NEhCSnf/gplSgYVSozbBBx/mN5ViXAJvYhuf871qJSCBzvYacCfhdTysh+H6l+xSU9rHGRrZJrCX9eMBWH1DjGg77V31b9h5G3q9qLFoF9g59O8B6JvNMLwm68fx7xtcsv2JSihdYfVsiP4NO8hNTwkwu4t4Vo71x8ghIjdXXaUgcU+CCSps38Q/EXJNVfeTtJvfY37TSAu8bD9vbtZq/LB8ms3jEBCeEFFzyIg520tP6vl7jocJVIPclIy1qfRJyDwpIydHbCO9TFSYNjuH7midQfW41eWoR98unmXZUdj/8AQDXJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pwWYcSInYwvT8pkTVL65G6zLxD+NfFO6UqF5wyP278NA7pJ3x/GHZL3PTZRv?=
 =?us-ascii?Q?FoSBzsg0Skcb2hAYz99oWFJROQN42bIveL5OF0wCA5nklGgfT0PPCw3dagJ4?=
 =?us-ascii?Q?0o17wNF14NURlua0qhA9KBAxfuSG6uJ8Cv/ryHmZcK/WpF+crODUnIaiGFAK?=
 =?us-ascii?Q?cIIRHcsYLTo5YrT2BJ+zw6j45lDfN85OdlsMaOj1EaGDBlok6MTqXSLmxMJw?=
 =?us-ascii?Q?kIOsZuHxuqBTrwYhPaoSOPs4asNKMA/fOPsR1ytWOtSVaaJFLqHLFvPerC6E?=
 =?us-ascii?Q?xMFv8F67HOyb8BvOHq3P9WXmrgWYTgRpxA2PR85pni9AZuayn8y+z/W1v5gU?=
 =?us-ascii?Q?xxUuYnn/IRmkjZPrjHsUVuKwvi73NL1IPMLIzMY4cVMsNppp32vbMcL6efcU?=
 =?us-ascii?Q?G3OeNPHesG8hIk/AfFTTMAXwqUL+8Gg5o769HhLOnLXpAxL5uG4kbKwV6UVg?=
 =?us-ascii?Q?O3+Wy6iHg5B37gnB0StAKho2pofhenJZ0OApw5EPB9ecjgWsRyNNrVjQQGtL?=
 =?us-ascii?Q?g26UgAkgXjFMtdAE8vMlOHViL3UmsPf5LCFOLqiZPiyc/ZrAm4WnDpeJRefb?=
 =?us-ascii?Q?vHKKM2T/X6drBXsuaAjqJx6l8osQcrLL9GF0vUTo41t0q+wVbouzTBe3o/xV?=
 =?us-ascii?Q?mH8It/qP6InsZ1uhLpAzZEFDlXGTJTsiWghFKhp85Y7cACuP1eD+FkIxFveS?=
 =?us-ascii?Q?R084AmeCR0PaSIWOQ0CVeIKwWB3+JCkp1eFV7/b9XPKQQRkJU6DuvRsdt0v2?=
 =?us-ascii?Q?Dgxek0xbFJwPkQ3pshU5/cQxfwuvaUxbIbRtzWs8troGQ2bUtiX8cxwmk1cq?=
 =?us-ascii?Q?xzVw7m7/PG34bEm+d8sfF9sLK1Oe2Jvcx12OcbUHZzpx9Pad8SiAGfApAub5?=
 =?us-ascii?Q?9PlSp36mM5NyBB8c5d3qRZtHxGOCCbVoV2J4+oaEy8fVGo0UQCWj9gxaidvf?=
 =?us-ascii?Q?PYflFyMfJdqns7dKI3i3n8wvYAAgxGw1H2B8jPgOKfc3Tr87wqs9QfAzQ3P9?=
 =?us-ascii?Q?p75UYYIVjilXpC0NqOcNzTWSNEM+HwGmJypax342XGTQKFhFCeFc53v4QrJH?=
 =?us-ascii?Q?hT17hJYZebsSnf8js8QQVdhqmq0JdHCQOYPbxij+OX4vZcZGBjvkKuPkxxRe?=
 =?us-ascii?Q?/gGmaCtefoWXWHWscrKknlJisWDCiE+5l/nTcepxjmO5KFn7bpOO97+kAaOI?=
 =?us-ascii?Q?jRuuefugBZnOnM8wpcbG1N8IJwoUSDtd0Zxg9gSwHchb2hdKqkl4ogKg1Jl2?=
 =?us-ascii?Q?yMPTM7D7TYkho5XRJJMYJn83kABB+cKbiftfwqwArbuFF0+4YyYLXysJXp/G?=
 =?us-ascii?Q?cjgkHnHp/GMyU5AHNQJ5LGvjVk1MAxR0nkhNZcHwK0/pmkLRB3zvXoIbKJMI?=
 =?us-ascii?Q?ipjU7S+o+AEpyJWZNsYYWJfBVuof3XRVGC3w0wYHJH5vuhTjyNUloT6uzE7G?=
 =?us-ascii?Q?a35PlxpqfT55CNRfDRm3o4jMz7njGJfqoE9uj1iA6k6LK94SqiSFRxK7o74a?=
 =?us-ascii?Q?CiForxKEmFp5YFYU17GpozQ2e1Cxn/zNg4wyDpvodv4/0u+svkZnV9Wkg7za?=
 =?us-ascii?Q?aa4sU8Y5chN/DuroYY5RR4v64dhvLTx4aw+5XH+5nfGfHFWx1LN0oVsGf5K3?=
 =?us-ascii?Q?59N8+z+eM5CY64kExZSxoaPQRiY9alxstgczgykbg/IhB47Y4oZyc0kwstIA?=
 =?us-ascii?Q?7ijbevBFR/na2mipRc5agQFyRootzM0qbKKG695xNEb3h76gvpnlxP8u0OIY?=
 =?us-ascii?Q?QLAZi98m8ETfTcJAAJcoMFemm+jrrzI=3D?=
X-Exchange-RoutingPolicyChecked:
	MLj/gXAHJjXxCghCej0UPa8i4d8GGdPO/EkOKa9VdfMYpgqKyuTIWJXTrWYlHinBcpznV53/ygI+8U+8t433poTG20jFonJTgFDVPqFV/eSB9A81Erpug38zHre3FTSwBnvOA2uP1hYPTI9dhJxei9vu2G2xg2b2IKfIxKKsBzstbxN6bxmrV1gq/JzvjNSWPnaBVyZ/vfzUnffSOWvFQMgwcwGE3IUagK6I7lL22GK3+U2HZrokC/FyK0/HOSkGeHF97ItnuK84iSXt3AknwcD7ukFExR+Jop53bjQOCyEecHCUqdCD/f/QGSExUiGPzQEyJ9PGd2Rk+Rjry+x+6w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VEpwx90WgcKHeLGDye2OC42F7Mwe7TBlzMk6rYY+aOzrdKNH7pPl+G/HlXXNuqPjqMp2pERBa8RITMb77IZzhQYYEddm6ZuGP8Gosva5FGZJSR/jWQ25jj0yBE+6pMUZmIGTldrwPzJwoLpzlP2aRj6jidocmjo1hLXINgAX2eIsVETd5Q5Q+8+PhsSazZoRASjU1MCRwXDTCbTzltncNkEuCQ1wifVTdv+HZl27gFrIp/vDNSft3ax9vctrw6i6QEQZbVqH9z2gHPjzte8FlZQ0Ps8PNely3kiuqqndJp8/hBPCDGdwyVGKSrLPXblcja7kY8+/om0HfB4fLnOz+Shfsvd1VqdU452q/UaOhOzXE4HlFsTXHjZa93fddzV4vFBpFS/5L4b6YFkR5p5E9ApIzG9WZhVug2oc2ofZd6TgLMNZKcoOVfHGCDbwj3Ro2LSKm2ZY/O7q0K24xL+if9Lu9an+rw+8Z8BhrF9Z0OYXT+xNf3YZY336Crgq12qH+pur+/MYZF/qQvq7zR/rqGeaS2eV/gW1S/GYD2yBRegtKE35DfRubJES6/lsP2FhyEvcAekYTHax2lZsF6llPy7FO2yfshROiWDywS0zJZ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23979d5b-ef51-457c-7e05-08decb475306
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 01:33:53.0396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxMo9XNs22b9lPz81jUvc1jb64YtuXcop9q6AmYFfdsnM9rtMqy8nZrPU6WK+M6+Hmw3yl2ZAA0lRHnRAY233chwOrqGVPBxiBPEEegeYvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606160012
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAxMiBTYWx0ZWRfXxQwbJjnaaS1t
 okVrdoELLoRvCAI9fI4Rxl64kP4kR2wvfGdkwGYaTqWgDQBJVnoDtrqJqI+F8sxwcYZLBMaky9c
 wDjdl1JdFZ3MQTmI053b/LC9NyXPCW+lQ9Oq9kt5UqKvkexb+TTX
X-Proofpoint-GUID: bOtL-ZSYJrDaZurQSfxY0D3GK9SUF2hl
X-Proofpoint-ORIG-GUID: bOtL-ZSYJrDaZurQSfxY0D3GK9SUF2hl
X-Authority-Analysis: v=2.4 cv=PazPQChd c=1 sm=1 tr=0 ts=6a30a806 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=Y04Z9SnEqkNsQ35l4CEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAxMiBTYWx0ZWRfX6y4H/h2Psnlc
 2RVRzSD4FaHm49kzvGj4bV1Px64LK9RDlSIm5YvrU2qWeNt9tke/rQDnXgtx48/rjp7jOn4/RWw
 PXXTur3gKj6yL2IMitqbnmFud28K3bfYHi36VCbHAd59Ej9Y1yO3rlvA/B4/c9p2P0FgO2o/W/5
 QZSFNC1hDOWDuwxRb0XcCo7vhfjyWU23rrMkZd3NnZzU4Kp3avsD149WKDffBz88bSlld1wUu4T
 IJLCkZYffg5Hr4UVyVKO4Aavn/rfkSePHapXIghYKxXGv4aagkk8VP7RVUZ/2LOKUJU1grrcHnO
 pq363GP6BlAeEJNCKAURiF4e4oAG+diROr4hzoVeHF/WDHKNSrMUejgyMZ8MBp/oSskKZUP7Cz7
 g2EgvQJANb/KqtRb/FkgDXUSlDekm0i/SQxr4hl2ueQk7lmhGvWV17x9GSS/sX34Re0wvIwWK6+
 eM6oM0WAyPRJ4IbkrrA==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[oracle.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,HansenPartnership.com,oracle.com,kernel.dk,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-15102-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:iacobcatalin@gmail.com,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,ca-mkp.ca.oracle.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 850D168B489


Catalin,

> Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind an
> export that is now dead code. Remove it and move the declaration of
> scsi_device_from_queue() to drivers/scsi/scsi_priv.h.

Applied to 7.2/scsi-staging, thanks!

-- 
Martin K. Petersen


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01843CCC0F
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jul 2021 03:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbhGSBxw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Jul 2021 21:53:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37864 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233713AbhGSBxv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 18 Jul 2021 21:53:51 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J1fvZj016519;
        Mon, 19 Jul 2021 01:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=fmtO7EbrFpbOQTjcm+Yt+hEmi/dfY+4EO8avVhNP2ZU=;
 b=B2v9Psylqv2q1fen8B1+DgeQn29xXB6/Bwqdgf3YyL6awkid2zMs1RB0KLEuFTLFO/0g
 lZeTua+iM5VXtTCT0+YECvzXcMBE2gOOcBFQPIQ/lBSD/egV+MSQJQ532kf7M/Z/GZoK
 V7BwPWIxWrsOzho13mzkcVIr7rYJd+i6VJ9D3yw48iBZaSJ7yRAOieq2NfFcniUxvdch
 oAXMLdY0gPFG841VEFwL0HtUwvt9KOk7k7TUoA9iyPGozYd2MpxaVST1zZ8G9WbhqCxn
 8I0LianvYi11Xq0PQu7jCbHgln+xemaFhRQKsbtc01t2Iira4aHOUiOEIH8mA2Ba/IXT Cw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=fmtO7EbrFpbOQTjcm+Yt+hEmi/dfY+4EO8avVhNP2ZU=;
 b=t97p8S/ZfNthp8IbBjzqBoDjjEYGkXw+hXTfifvqTp0CAK/xb2LxVZWbf/XCbUlYnspD
 O+a4OHPb204jTLwgRs5g95yI6trB+0CdSbKPCMz3OjIwys3bpuT2fIfweYnVNorznVzw
 J9/7tSYfgB47aIgIpjVNTap9UEHN6NyQE0ngKlUFqV/4vh3Io575Eurt1X7V7J9i6p3i
 xkFM0moj371shzZlrT69iisctL4CjPU0wH3ESpDmAKfvkZQaCbcGy/tYFjROhZxnYykC
 ZjrGo6S+DQgFbJeycQBztY9c2Wy6stH6YvDvnm4YGtqhbe1vUtrKFx1tqs3ys/WOfWn6 LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39uqrthu4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 01:50:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J1ex0v080415;
        Mon, 19 Jul 2021 01:50:09 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
        by aserp3020.oracle.com with ESMTP id 39uq13t6st-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 01:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPYnkqYlqfUH6Hov1aFjA2d5HCbCtgTGzjui3kW13ghulEFBlcF85T/FaFhvV/B86ImTEn34r0uva39FWhXDZHCkPeS0tCrkBHWE7415zxJj5FNLo+MVeu4tY7yZw+zAabvwpcb+BV+RPWPuOfkoRYLn5Cfxa4eC2Wfa8XYsCnGnrxO3041H6lR1ZuOQ88rNL++BaMZdIHG4pVPGMHJJeRletyaZWEKrPtMKefL/GnJOmasiuZDOQcwsHltRdg0m+aZOps3u+Mh8jWbgJKEXPOF3kHisD6SFWxJVyZIkS7xGwd/74b0lIFjhqbqFSWmAPbTsuxeLyNErB3D35xhGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmtO7EbrFpbOQTjcm+Yt+hEmi/dfY+4EO8avVhNP2ZU=;
 b=MxyHzZg/pFmHKGL0SWxGMshhf4ycel75D4ezdcy+JtSCfvhxpBwfO2pjC4OcmE/fDX65v9pQXM1/z/xR2JREPIQ55g2J+5cUOroMqNBfBXIhHE9ltrBfM54r5+Hw0+pIAq4i0o++cOM4gN1masA8I6jWO5Sla7weyoZnJmcOMaR8katDQvqZa5uhhDCpuXmc8lxIifI70ULZzVnwVfjbLuHjrnjEtN3HTxveOekLbB3Ame5+sylZcHqAZYDiHlhgnH5DxeqFSpO3g8bi/wuxLDIBGGFrzDCt8SPBspc1lzuX6OPGPA9OQAIkvRAIO3LuwnHWINrwPEN5iEuIQpSuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmtO7EbrFpbOQTjcm+Yt+hEmi/dfY+4EO8avVhNP2ZU=;
 b=JFI847G9/nWDoOUBAaUsP4Pb9bGYrvsaj40pDdkLIBV6I362yF/0s/uISGq24a6jfEtS92ZmEegphOV7LaXrBPFIwY1KxG5f2C2XiQnCZytfmLDkduOUDVuWYiMLjVhHmVSwnOBcBFKIMYqDGbTjGwuf+Y9SMX7/8oOEHuYRtZ8=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4757.namprd10.prod.outlook.com (2603:10b6:510:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 01:50:07 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::153e:22d1:d177:d4f1]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::153e:22d1:d177:d4f1%8]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 01:50:07 +0000
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/6] aacraid: remove an unused include
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq14kcr13ct.fsf@ca-mkp.ca.oracle.com>
References: <20210712060928.4161649-1-hch@lst.de>
        <20210712060928.4161649-6-hch@lst.de>
Date:   Sun, 18 Jul 2021 21:50:05 -0400
In-Reply-To: <20210712060928.4161649-6-hch@lst.de> (Christoph Hellwig's
        message of "Mon, 12 Jul 2021 08:09:27 +0200")
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SJ0PR05CA0155.namprd05.prod.outlook.com (2603:10b6:a03:339::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.13 via Frontend Transport; Mon, 19 Jul 2021 01:50:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e9e7cae-65cc-4aa5-9006-08d94a578908
X-MS-TrafficTypeDiagnostic: PH0PR10MB4757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB47576FF2613401CA21FCBD728EE19@PH0PR10MB4757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 31h11GO4np8awU6eAtWzyNK7umdHz50XUs8/F/u5jlzMMa89j7QhHTrXOu7MRHvn2+foUrihtnxDpM+WmgcUzHv4U5gFVNc5/Zhgb29N2TLjhU51TBEllXDZRxY8cLx/GYM0V4zDc3JHr52Lx5i67AWGe0WoPgDLh4SuABk6SxDZdOmyQzbIi53vX7GUgmwGkYNnvFnyXCwzAtR0I91C2yMEyWu4CCuIdD+92RDu2pImcRJPqE4QYW56NKD7K8fapq7YcXLSUNaZXTFeE9AqvcokiXEgiVv4e7uMszLO7n+qL58EFjGQzRBjXggQd6xDfHKPcZzfc4Eq5NRSWzGQYbmbB04XQXMa47cfMiWCzjm4AeGFlmTbbR7dhBfnwv720AXJ/KdvDMCAOaPqDeQycmE/bE4CPATW1bCFPv/dWA4kRnQvkQWtHLsN5Py3afgLvhS3qxvuiOM1E/bcP5k6doANitBtfkEtOCpABEcXKb9Tv6lj195mcvWO2J58xr3XqyuJaeYJFDnO8Dg14nUJBwjsPw0HYIPyJ553grhBVlv+OjeVkTeyI8ZYql22RUSXLZI4gdbSaVwqHmzZJvjex1kudxNdckAJdBhqcYaG8s3xTtScTVgvz8iiebV5QonRsvc3Lu5qTsEwGmeuQZ7woUpQAZhsIAz+dYXl1I43ucJEbaZPLAVMqkw9AsKZCJALwPBAjZnTLCoNRNzxdIdp2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(5660300002)(86362001)(956004)(8676002)(4326008)(478600001)(66946007)(66556008)(66476007)(8936002)(6916009)(26005)(36916002)(316002)(7696005)(7416002)(38350700002)(38100700002)(54906003)(55016002)(558084003)(52116002)(83380400001)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VCchRnAGVIGosJPD0HYZ46M3risa+SIOIlW+nRpFhzLWPw0bgKKozRJ7vJs+?=
 =?us-ascii?Q?UdLMtNHF3g6WztcXB8CpiGACQZfTfTgplsN2whqpzVWe9Js5W+0nqbdixICf?=
 =?us-ascii?Q?6Vvi4uEOvirjKG68cVHzGq+tnktKgx04aQIBCugLrZvcsiojuB3y99twNxJr?=
 =?us-ascii?Q?ItAmuqnYSoxVL+07AEduIKzUUoXusftanz/QEtE9QVnRfveIOjnrlRloOCi9?=
 =?us-ascii?Q?sPBTBk7O8/PdWvXD5/x3s43mxjFgBM+qLNJ5xl0jXntu6SQDNu2vL6dQ0N2A?=
 =?us-ascii?Q?YTstfh3QVAYRRpT8no4nObeLlJpvshe6JfcbL3RaE8DbC+UgqcCbDqSwPDO/?=
 =?us-ascii?Q?rY2LMk/zW5XGNYXxW3z/41XfOrn8s+gzYDZcPeLQnVBSsxVZnOhn/ZeKuHnc?=
 =?us-ascii?Q?4wWY0DJYoFBgwasGBuDrg6SenIiIuwjO7imo7/arvgadQEXS/k+XF87dy/PY?=
 =?us-ascii?Q?w5TtDHXGwqGXdg9zvaBqEXGd/VvcAgXWan54Axz4F1+CDv0oubknpAjCn4qA?=
 =?us-ascii?Q?qanZrcvplZvIzPrgv4WmNBl3I7+xEoBOCGKvY+rF6CD/z16H+z2VebAGz7mA?=
 =?us-ascii?Q?Ee3jb8spZo8/OhX7JgyMqEprOFb7NmvZhg58FSTAw1CsN2gd3AkuIFkQDg7l?=
 =?us-ascii?Q?eX7ElXQKFB9OqEc+rlgecf724BxllImt/EW8Jp3f3PqfuMAbmrlxFfiXMTuw?=
 =?us-ascii?Q?/frodsBgtP0/VepmTOCvZMbxJxeNA20jEE/XTfYcHbkNgjYXlD1j0/aNsA1D?=
 =?us-ascii?Q?M3KS6hzmfv6xruIU6QjjNWdBp2vi4jWapbZ4N/BYUyvdNf+YM5TAiZcbMjBZ?=
 =?us-ascii?Q?72PRkn9pl3nUKHKoCazUAS1a1pjUomXlREDiCjkWumkQCgTZWKvvU13+Vb3X?=
 =?us-ascii?Q?fFNUGoRNwXeEr7arZSva907+PlpFjnLo0e9hdP/MsDUCw2mBCIkh77NMwyKL?=
 =?us-ascii?Q?CQV24fFNcU/0jFzf57zT+bVMMNc4MVaBa4MqJoIxEhUWIo/6yFt91qRof6C4?=
 =?us-ascii?Q?65Fq1V9wgeUwOmXCm+Ey8mSXXrX0fcKisWgh49KtFumBb9vRWV2BRcZERQ8c?=
 =?us-ascii?Q?6LeqUHfBU1b69ntj1+UGEz4RgXAHR7ZIaDczpfLTuKC9wJe0A4bgMpDYgu7v?=
 =?us-ascii?Q?zjDHa269s+2S4kn/a4QHVZiQBeRatGV5OzrT8KRwKefg2iBQb7duhsr1okRs?=
 =?us-ascii?Q?gbv95g5ygNdGluwtckN/TRFMPv0htnIkcnr+XLdwSy/K6FCyTyISB3pQpyEv?=
 =?us-ascii?Q?6VV9k02n9vAppb/DNER6p2CrbocU10TKUMlP4t0FmKrxjBNP1fMpPgmhy4MW?=
 =?us-ascii?Q?iLfVPP8eGeRdzDUw81ziw7wJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9e7cae-65cc-4aa5-9006-08d94a578908
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 01:50:07.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/EQtFgers+yA/op8VhvubSGRLnGWnZvwgb8cA2fh107ioLt/LYQNLuRlklavkFQ2wtTwwZ7slYxbuAlFyaueX6XX2ajCNSbxa3fB6nfcN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4757
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=619 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190008
X-Proofpoint-ORIG-GUID: SYAvASKiSg8mLHOpHSxOuPyl8cXUHAX3
X-Proofpoint-GUID: SYAvASKiSg8mLHOpHSxOuPyl8cXUHAX3
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Christoph,

> flush_kernel_dcache_page is not used by aacraid, and this header
> already comes in through the scatterlist/block headers anyway.

Seems orthogonal to the rest of your series. Applied to
5.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

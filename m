Return-Path: <linux-mips+bounces-9914-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F6B108A2
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F4E3A5E6E
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5E626B971;
	Thu, 24 Jul 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K5vi1GvH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zVVh3RB5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8CC2690F9;
	Thu, 24 Jul 2025 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355431; cv=fail; b=eTvo7MnZsvX/hTgwg/qcswqXFzb3VgJdK2rI53D8KccQ8vke3BRma0OPHqHWt2xQVqBtKgPk15WXJtzbWYwMlAWq/Q+iE6/ELUumB5PdlgoVM13FnmCumflI9IxQYH/aszjiC/lpIyet1kxjNbfj2SSGmo8YDp3qmoI25DmHJvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355431; c=relaxed/simple;
	bh=WyPEyxbDiy846Ca897t+VYOi79eIrWEgWjR2MlhAI1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YOTluBWyGuh69Y9MSD4HHIMloIua5K3WDux6xyMzie4GtDo4LRSynwL+Fnxlbaoo8qnAD5RLs/hQ/RxyD6kY99aSLT/dTzy8VcCYgIX6liseb/IYKXOP5PWEnXI6UkOyM7fwlyMsUAsyOxjYVVI2odwydmGh37CkaNJgT9IiyxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K5vi1GvH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zVVh3RB5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OB1Kkb023095;
	Thu, 24 Jul 2025 11:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5xUsG0QXZ9OCu6Lk4Z
	AO7KcP7qTjdI6vTN/MigVvFm4=; b=K5vi1GvHEAtnjPzb0FgJJ4RQnCbomy5h98
	mAZBrTKEu5JxevmKRv4MWJwhsK/Wb9EUmPbQ6ZJKzYm20R+oxkDx6nicXVWtQ4WD
	h37mEtTWX1II4pafFImb2n0Xlx05m7ooKQ/DpsUJhCE0o/OS6ZS8g/xiBHJyWKcw
	GkhyvJg04N+v2yMi7q/LwCWzOFvnJm0qAIWr9WaDAXiIwwxftP28Bzyz0UDuSVWt
	N3l8u8GCWHdJiboTUAtKwA5e3Q/yDBka/awpOy9Rd18LzmFioSyM9XOzfy5NN4of
	L1HWhNFJA9OppBekO0aNmU+xuJYfYutRRBI0zoMjLiMXwhDkBjIQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056eh94t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 11:09:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56O8smYj011037;
	Thu, 24 Jul 2025 11:09:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tbqdj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 11:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz/HyfOBjHKfBXlm2cKhmps5WWLcMG0f479PI23Xv3Zo17vbI0L50Q4py+f0N8+Ww2+OErBf7uUYaTWIcWvA9Xk10nG5scwmQqn2uOgrNhXDoXaPUHSecuUIxYQw9jSRO/s71tdWMuT63H2QI1ACRFNoST1Q83rSCAWSHEgMS2ikCeO9LAzgPh/nNFVPTmpf7QlfaOKBR3OZJaOA8O0e+wJwwNxzFbfZmG5TLK2t08PbxzxZQhOo89Oc67t6/JCkRIbdmXzarPtIfjCFxghkdAcO5lBL0L9K5qDgWD4tw98pCgQB9JXIEncsDYFNe7paFnJxbtiJDhyVj9R5h28/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xUsG0QXZ9OCu6Lk4ZAO7KcP7qTjdI6vTN/MigVvFm4=;
 b=h9OpoXzsgPoTF0oRmipD3eXQuRtQwCyhzAz6ZUlFM2vWuRCRWnY6L7LnouhmmgXScZ2MKllU2FxcCnr2ahlV5dPb0NgumCNdF3wLZo6ZUJCCptdYEJaV41DAyesRi3iI144wPQNoJ6c+gcgb1BJfH8Pa3ayQfP0HfF61SBS9/n+VdUdla6L0ixBLArZg2sD5gqDDf4arL7E0ee9wzEmucmETYT/UT/mniHrUxBj1OnII6JbLtsoEwxX7iB1icJPOOYMA4u0DZ/e+rJCOXgxRcNlCIZ+aqd12QOAHPN1dO5tJth30XoRX+MkuFsmFgriB/S3a66VpzaPX2ult6foLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xUsG0QXZ9OCu6Lk4ZAO7KcP7qTjdI6vTN/MigVvFm4=;
 b=zVVh3RB5HNl//ZZlO146B/3NjawKxPN1CQPvJg4ND9So1ZRcSNO4PpLfwTwoQ19szx/AWhqtpqlmMLtqZb9o/jR5ROhW4lwVF7LqJ7jwJnYyL8OLkm9OGe5+Kz39sF0iWTU/sCXf0yF6JevEmME65PXBk/EboYhfS4xAk03FNW8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7336.namprd10.prod.outlook.com (2603:10b6:208:3ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 11:09:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 11:09:39 +0000
Date: Thu, 24 Jul 2025 12:09:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
Message-ID: <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: a448b556-c647-49fb-36a6-08ddcaa2955a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y3O53bBNSqYZcCUY4XpibgvUNxeFMq4hC1v56zxRHwC5jYsxawxBwCwCjgLF?=
 =?us-ascii?Q?FkEdMkHtSV5GmyjA5sf6CCazXKFNRkjZfaxaBqJHzfkGR3vP/Mu79AQWSR80?=
 =?us-ascii?Q?VymcCWZL7Y04fKQdhgGv9zxahiwCU6aConts4h0hiSlu/GRFtyX0ydsBi7y9?=
 =?us-ascii?Q?s0HbCBcpxNajxNRF6sswTUJVtwBit43COStMjGTRwvOzlD4IzzCrlhKpSfkX?=
 =?us-ascii?Q?9HAHk1W3DsKgD9mYCVt7/TslC+LCzu+dD2nHiR1lYBA8ExzklKH/OyvfncTX?=
 =?us-ascii?Q?Xz95L3ANKqCbDvXnzCaAr1teWWx8EuLXAUiyRzMVmUKtcIZ0CX68S+5skz3I?=
 =?us-ascii?Q?NnHO9H5bj7h4WZvIMbMKckBB78YVYWKNwu5+7hgHdGAIJn6YZgI6eN00EnGe?=
 =?us-ascii?Q?d8XeORr/IBV2BpZsz2LYZ0zxRpzxg8MRkoIGn46+x9a2SlIi+lV+3oNFbQWJ?=
 =?us-ascii?Q?HeIOvKmdWmpczrTwo60YwiAggXM+KUGGQZeE/bLjk7SOkhsfHqznT2e3ttCW?=
 =?us-ascii?Q?39H3mOmiXZ22pzp9Ys6FLu5MP2f7isvD7gSAf7XmJk5jJ3cFDceolo9lBpzf?=
 =?us-ascii?Q?ilh8+qfSXr5tBcOOL9umd+mftWHdxI30Ql/6RrPZgDrXLqhVLIdjJzUnnGXk?=
 =?us-ascii?Q?DBPh5oFOGMUJbJNBqeuy0N36HiTCGJOakoj5VHbI0RdiANytyIWD8H3xKPru?=
 =?us-ascii?Q?JhD3dbPK+YPyS+HBbg/fxfpdcVVo/i68jWgCjIjEFu68DRxeOKZJvJLvj66F?=
 =?us-ascii?Q?zQO6tbpeD82YCSS7I5q9zGhTERFB5nkthGmisweblSOKz7Hyd4ANst44gTdo?=
 =?us-ascii?Q?cUQ1dvPXxhye1OikBM2abSCby9AGACH/Geng9mIPD7iFw8Pnxp/47tcfQkuI?=
 =?us-ascii?Q?UGBAeAhsfd3cOK/HkWfLHncmxLlbpY+CN5NnRVe4mrR6T06a9UMTphk5PQDD?=
 =?us-ascii?Q?v7qWVbu5EBiME5Fsh0MW8EDPa/MtytvotwTno2wCcht9YGBf3J9G3KN1aZSU?=
 =?us-ascii?Q?v/tcuf8zg9zzO7eD1HN8vhpmKoXCw+ylb67o/7jR5OkqkfoLF+v8LH5uIQs5?=
 =?us-ascii?Q?EXm/dWo/r+BMbFZppUg8zwJpadQwC/k+P9rPAjY2svi/CmOMlD8k5Wx+vxwK?=
 =?us-ascii?Q?bGgPH0Hq92iAaLr87846RRSjMdPE9jaHZqHmr2OoI25Md6z6/geE9nfXWBs3?=
 =?us-ascii?Q?M1TZrWgWpoxx01Fh2bMgzStPthb+5pKirNx3pkzUXKqSaLaLOe9f//nkywif?=
 =?us-ascii?Q?Ly6jX6A/M+eRcIpskp6/yr4DvRbcAVl8OQkosSenlpjUL1qJNTGsHdtamB3u?=
 =?us-ascii?Q?7AoUS38biFmzL4bFpbFyR6PE11HEGhBq2SQiRDYpXrNvg6KkfcGrJ2KQWmmW?=
 =?us-ascii?Q?x+6xKOoDq1KCGXbVcWP2qBULoLALtwePTKeCY0p6BtmfBkMU4tVaQM8mV//b?=
 =?us-ascii?Q?Z2+gzd4jeaU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GXQFiUbYolzqgvhp39fuwXR7qUguyOUxzcekLeeiV8tUbvw946gSYmTv7E/y?=
 =?us-ascii?Q?u4Z84nbNDP67kY8BSxjN+DzFMFsDenh5PIJkSBto0vT8O+0ZXibL1VzuwVTg?=
 =?us-ascii?Q?ABkPO8w47Z4KwB/sNHMXx/zhpksN2sQfH5c2wy4Svjl2Vr6AQvH9S2OhCFlD?=
 =?us-ascii?Q?njOYfZdbdgfq/inzKA4vKY4HHpoIdmxP1dXVPze38YpkaKky6/kDrc/zZnwI?=
 =?us-ascii?Q?PwU+/LcqwCWBLxvxzCHhUxtBfgXMtmMRDeWd7jKweEWhHNDmeqqWJSuyN/49?=
 =?us-ascii?Q?TFGAs4uejTPrPovjlO1O+RnXjCdCx97PE3TAvjcewuyHUcUg0lgOZ3nZzmXq?=
 =?us-ascii?Q?p6cp5n0JUGFzKizLhrsGG5A3WuD1KWHDjVrDVIVk1k8vb+jz7r5tkag/c5Fv?=
 =?us-ascii?Q?Dv073fuWQzTyGZiV8NxklgQeNhtT1v6GR83gd+BD5q0t49BSCcPpFZog1UMy?=
 =?us-ascii?Q?YzMlV6MxN4WpMR6QN6LJPTIgBjUSBe/8MqexEd2wA1nAzjT2oSiegJkurjwr?=
 =?us-ascii?Q?zbaSqverA2C3BzWmA4yor9nM8Xy0A4EZOBkhBB5+7Taa1i/l0xCOlAuo93v2?=
 =?us-ascii?Q?Xdsk0/fSKz8v7SzSJ+MmQd/ArJbwHbvOqC9rYUnl0/hL3/LoD+tjDwxnv/vu?=
 =?us-ascii?Q?KAeCY3ck1we20aM6vZFkF7X5FnpnjblEQckEuR24FnmxCffB03dweX6m7IO3?=
 =?us-ascii?Q?fTmfVKzGQp5e1spsvtgU4A6qLEzukXeEENuwqvmu8tX3UKsgqduBTlatkXiN?=
 =?us-ascii?Q?jM++9if57T5Hse6fk0dmrSTwoZt7lzxjSKdkSY8s+SwY5Kv3eh6ctbguFB4Y?=
 =?us-ascii?Q?BZi1mA3zSMxKy+R6fP5LGA9XH4kxwK9G98M+fuIHkuXlM5YEUDdFmz8MaHPs?=
 =?us-ascii?Q?Y89F0lBZrbi+kx42RWBf78jNRaNUD0LX+qi2gcEfEjH7lEPrNgU358Wte0pY?=
 =?us-ascii?Q?GhdaXK12IX2CF3XN3w3giJ8P7HaopZ387jcQgZ2FfwycjMNwrHA52FkywPFK?=
 =?us-ascii?Q?KqtHQVK66c/DihZkWpQRq4l4+pB3RSDWnJ/scro+BH6c1/IjJZtY0ygQcSjs?=
 =?us-ascii?Q?qWcelBp/wBJDZgVwLZC+7DDsOhXEVqzonWfJD2R4x3PT5lrtRrgY6LF5b9wq?=
 =?us-ascii?Q?wDUh9V36a3I7xynqLqlEn4hm6oLTnPa7mWMoOPCrt83fp5Qz30ZkDFmGGRAV?=
 =?us-ascii?Q?zPuJ+MwvxaItHdvUt6a02G9BVEj7desAqb2TFk8M96Qr3pTEdfh2/pd/4cNw?=
 =?us-ascii?Q?T/XEScbNoIK5WEwjt+3ncTTn0UwvuLE87aZXSZY59M7Yai8siTfXcWi06lXP?=
 =?us-ascii?Q?o24TCZNTaSC7112K/PRfZhWL7nUxhjS7FlP5uP1/kOca/xNkA42AdpKD7Ep9?=
 =?us-ascii?Q?gP6mUY3DzzRctrfRlNBYofo2JmNXbJ4QHeKHWNiuDv7Y0B9+2DNVyvsrt5RB?=
 =?us-ascii?Q?5wgrbAc6wItGXeMy/8i6ZqDtpOybBUXRf+iFkUBNc+k0f2dfYBB5dvMkwNGV?=
 =?us-ascii?Q?mxVd794w4aWAeXFOMYa6BYWu9OexZeo9vUa+LU+MVZWXqjVQRKtKL6iw12UI?=
 =?us-ascii?Q?k/5xGuiTqlFeVqZnpv6rae95C3OT8SzgGa0lN9jXazJg54EtczLYorFtlcL/?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zH+X54RcFxv0jZ+YApkz+3EGH2zs//z8vXmtXJ4ZBiG7c6LVIMQRtHHkNtxAGyYCHKZWu97weRXQU7cUw1zBZEEpAi5rERujA4jube19ivgdsOEPX90W0Tk5lmA0JKLqBz9qPE+ERWJ8w0IRuLmmZAurGGxmAHzrnr2vuVHMPhpOiDNlEoEmMeE8yqryiu8d1ZK+S+EtWPU3McpzClh4UXk++6eEFIuH+y7bI8HtbWAJ/fiNSGnau7WaGGCX4AKypuIFT+vShtKNhkCG9yFPbxv4P6o2gAW3kQieGcJfaA73clBLMOMflII8HycU8/62v6+H+ZBpBPKXTRgzEqaEqOAkRECw/AsQW646i9UfRAgLFQSJIspx+LI9u7XyhcNQmB3jtctpnHUFeduy7cYznp+/DO1FjL3dBVfAt+W+p0RRUVEMOGVHv/7UBDXDI+AoIZEULVpS+kkzSo7XOAQX0yDjpqN51G1vx7RTTD9M+OJoO4fjwK1zqIyTmyWagJVgA5EoOsqOOK6eoGKcCWdiHtnuPgcMoZ1iLY4mmB0tm0efqiGXcuRC2YRq8Ud5rgN9MMMxfrLDil2HENev6c8dp+rNJQDIxtGHC3N4NM3qSYk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a448b556-c647-49fb-36a6-08ddcaa2955a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 11:09:39.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxyi+VCo5e2HO7Qc2hScb8rHzYPBfAF+ypd3DAWNyWNVl6klOZRW9hjzKLdzis5QK1wLHGBjIet89imRxo1UIeXxc2R3DsbfkHNWb/0nD8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240083
X-Proofpoint-ORIG-GUID: 4UzZvOd0EmrZDS_tiLOIn-deWdNhgAtG
X-Proofpoint-GUID: 4UzZvOd0EmrZDS_tiLOIn-deWdNhgAtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MyBTYWx0ZWRfX8cfw+2U3uZ8A
 QWIBKjg1wwAQPJv+rAdVuljFvi6ASdrp6G1BVNbiP8IY+rhMIVvMUpnookspjbGhiUHo3iNzihT
 tHHAaQKfbdNXDpuELV5sbKskF8clcU4jY5INBSJWW4Xry1qMc+m5FSAWc8Vv0+3FbwfzgOdn1/d
 DChaw1WP6uKSCV4YWz/aCOvx8fYyqWSiyhp847F/8LE/hkJtTuz9nHxbvJoe4twcDmSGFjBWwbi
 5tz4YFFYyy/GdptIoDZLLjQPsNxpv2WsoH6T0iDX6OrbwRtwof4OPw1HxF1N3rxdYAVOVrGKf6a
 xkXGQ1MsuIYzAm/09/wsoKVNVchQBGrjX+B/vfNQYkxQ0yGwUITk31MQQkqClUnYUB7S0l8EzRw
 wayRZgcEtuFovGul/dTmc8IEUHum7ay+1iTqiOnSBG1dplUfzEC4vNwfVJi9JnVT+ZVemuRn
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=6882147d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=KKAkSRfTAAAA:8 a=yPCof4ZbAAAA:8 a=SR-w37cEl7jDBDJ_8PgA:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22

On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to strdup_const() but for copying blocks of
> memory that are likely to be placed in .rodata.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

LGTM afaict aside from nit below, so:

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/string.h |  1 +
>  mm/util.c              | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/include/linux/string.h b/include/linux/string.h
> index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..1a86d61de91204563e4179938c4dfc77108e03aa 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -304,6 +304,7 @@ extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
>  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
>  #define kmemdup(...)	alloc_hooks(kmemdup_noprof(__VA_ARGS__))
>
> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);

Please drop extern, it's unnecessary.

>  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
>  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
>  extern void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
> diff --git a/mm/util.c b/mm/util.c
> index f814e6a59ab1d354b8cd04ebf3903626f6b23a6c..f4df9194b0c69c27ff06e6ba1d1137c559035470 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -142,6 +142,27 @@ void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
>  }
>  EXPORT_SYMBOL(kmemdup_noprof);
>
> +/**
> + * kmemdup_const - conditionally duplicate a region of memory
> + *
> + * @src: memory region to duplicate
> + * @len: memory region length,
> + * @gfp: GFP mask to use
> + *
> + * Return: source address if it is in .rodata or the return value of kmemdup()
> + * to which the function falls back otherwise.
> + *
> + * Note: the returned address must not be passed to kfree(), the caller must
> + * use kfree_const() instead.
> + */
> +const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)
> +{
> +	if (is_kernel_rodata((unsigned long)src))
> +		return src;
> +
> +	return kmemdup(src, len, gfp);
> +}
> +
>  /**
>   * kmemdup_array - duplicate a given array.
>   *
>
> --
> 2.48.1
>


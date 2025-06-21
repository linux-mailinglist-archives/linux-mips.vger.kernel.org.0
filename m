Return-Path: <linux-mips+bounces-9449-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E2AE2727
	for <lists+linux-mips@lfdr.de>; Sat, 21 Jun 2025 04:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA04717DEAB
	for <lists+linux-mips@lfdr.de>; Sat, 21 Jun 2025 02:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6F4137C52;
	Sat, 21 Jun 2025 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LCNWs+sM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sflih+g2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257A26AD9;
	Sat, 21 Jun 2025 02:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750474442; cv=fail; b=uERPWs8soAOd3ShCcVRYZ7Pf1dEtgcN5jFHX947XBAws2vM9A4ECNiWy4i4Mc+hQ2g7ETroAQ8woWR/63b1Irc8D9pUlRZedZ10qC8aKFCofAePU3iXJ9QI7jknwXErwfX+kO+3uREIoSQgx8/xb2agfFr9idzt0CkFmtgRyJJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750474442; c=relaxed/simple;
	bh=FtMjjg4+BLo9LW0yOT7ASAoO7H29Qa03WzR/rTGnvCo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=rGuAFFqngb0dy9dk7tZM+g7TEpYWHf+ci/a9JHWu/Fn3aXJPy5+DDaMJ57JoPOhfWv1I1YovW/Qd/la8FYJ8zg8bEfIDCv+HQ2uREB4OdO7z2LqRZ0zDp+zpf3jamfEVriA8W1Jg6Cxqaem4oOvG3dZt9wBybBp/0kerelBD9o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LCNWs+sM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sflih+g2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L1W0nH023779;
	Sat, 21 Jun 2025 02:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6sQLrr7+dPgESszrsD
	pniznXNLwmGSOCiPaKMwX6ifs=; b=LCNWs+sM1CFwBoxQ1pheFUssCiCsti9K8C
	9uM5duRXnHfZLQWrTxpXaESBQ+crUcNkYk1+WE1vGJ0QzafAN/TUb6HhRaa4nI4J
	dL5tzvT73xlERMswUugbJhbTrL9irUyAc75zKlkKWNcNL6v1qr/l6IiAePPx2CoO
	qyjaT7Q+yLBv+9Yxh1EmM16MVTzAUxxDM9m0fHjDct70vTkEvPIb/FpPA5pzNG1e
	wdDckOo1StDD+NnRHI8nr8Jvd87qSxzkArGZAhsQNYDiBEkZ4Il5WQp9dglUZVF5
	E2rXiWdFSHaTGWi1mlM5Faj+QXriqj1rDEbla87qhFToez/f7AjA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47dk5h819k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Jun 2025 02:53:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55L1XqYT017779;
	Sat, 21 Jun 2025 02:53:43 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47dk67h5nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Jun 2025 02:53:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqlLFLHjdxjz9Lj5VU+v7Zky9cgjKI/THtS0KpRPC/e1YfZYoQsjucmEBesjXZlGMWfOdzc4ZaYesXTqnrWytJ/vtpIVIsOQquhmjfhu0PForX5ZsNGJ06cc8EbWAXLqZxRCtP1CrauA+Pqf8vxUJogYsxsXWHOOjHGDCjZejus6tnINSlw/orwP2B/nJ7fVIW2/raWgY2FkdsRsiD44MT0h5EI+kbfI+VL2M7EGEhpnIZrvvlaWzp/JbrqFGdyoYibL0xnbZ2IYgduMxFOP8rc2DlHFsNA94WwuEgDpRRMaBDlk/imVGFSFWcmdbpNDEIaW8XDR72NmzjoCPo3xrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sQLrr7+dPgESszrsDpniznXNLwmGSOCiPaKMwX6ifs=;
 b=dUtAWAr9C5/5kVZZFAwBIHvkMzCXG45d+wToej7BOSERwPHq0NGNtoJgdLYcmJjzI0NdWPyB9lk6lx6wd5lzHDutzVRp8kXVWJWiC28TJIz8WOVkkep2c71Gnwpf8OU4uU7ZZ/IYZDa/qYdxMZ3sEpIgZbp0LqaiUnx32fvsz3uMMHauhUDXT9M0yo02N6ye6VNwoLBBRfBLM9+44BQG0LxhNIpOveQ6q2/D/Si39oHqqFl61NasmvbgErJrjCTxt5yxrochlpR8dEu8NTlsJy+BppNzyyLQgphLej3URDvd+KrUJR9AGoK7Rh/dcdPRofDwtwOge3U8Ge/PXXyTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sQLrr7+dPgESszrsDpniznXNLwmGSOCiPaKMwX6ifs=;
 b=Sflih+g2C/ngwbpRJxnxN3KTiPMM0Xp+sTKRsnQ1278QxqZpRFU5swxSHo718U8BwuRFs6GkggtIwshL8bDSak9KRSp4WIr+n1cVcY2SOPSIFItjEnFQXyJN9eZnzJELXQO2MenhwzJbrA53UmsA0e5wKx+mDnRQzRPLIQ75aPg=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO1PR10MB4481.namprd10.prod.outlook.com (2603:10b6:303:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sat, 21 Jun
 2025 02:53:16 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%7]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 02:53:15 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Jason A .
 Donenfeld " <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to
 lib/crypto/$(ARCH)/
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org> (Eric Biggers's
	message of "Thu, 19 Jun 2025 12:18:59 -0700")
Organization: Oracle Corporation
Message-ID: <yq14iw9st4r.fsf@ca-mkp.ca.oracle.com>
References: <20250619191908.134235-1-ebiggers@kernel.org>
Date: Fri, 20 Jun 2025 22:53:11 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO1PR10MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7504aa-5c57-48c2-eebf-08ddb06ec494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fyZGHZ+Ddf2C2jlHUwq/gmXIzR37U45gVmMcOoMNSh/P1auPxK8NTDh3Ls/k?=
 =?us-ascii?Q?MF+Ndu3miKRmGldhSPwG1J9PtQ1YePbXuN65Z0g/6s5KnIO0RmoluoMwYw2H?=
 =?us-ascii?Q?oHwfXT2xx+CztvguL1V5VI4D0da6cwoJ7qPeD25vkkgD7g8uItSm2xC1fgKr?=
 =?us-ascii?Q?QosOQOO03kIs627/I5CJYPY7bZrQ9F5J9deg8ze93mUyoXhOuQgA/BX6js5T?=
 =?us-ascii?Q?b1pmTqw+fVeBa2BYtzaQYw4hwXr3nx0vxDJQmE/+9pExoEIg+Z6RvrtB5js4?=
 =?us-ascii?Q?hTuS9UlLApKgUFO9ZqEt7md9pMHJq0OxHrtgdt9wM+YsfhVeQaGTP94VLGet?=
 =?us-ascii?Q?ChKsXtqZN4e29BZ3QDWnWvB17KtH6kOq60d9vqKP4OP5r02b+XuPWJXPkyjz?=
 =?us-ascii?Q?1abK84lWOfcjtGDDNcXNpA+4lbRdYUQnHqFCXzvNUQuAOE11nlV4ULzLhoEf?=
 =?us-ascii?Q?oJNH3Sn2reHOSEvLMh+tjKVwLgHcTJ2hUJu9xfxkb86EanwdHj/UK4Gf8wNJ?=
 =?us-ascii?Q?9+N+sT15l8CxH51476m1bWdGf2ILbbB0KXI6C2lvAOET50Dm6Z5bLW9hMOhy?=
 =?us-ascii?Q?eGqugOuto/TtouSgS5S1FBEkXYFKkr8SG68m4iiedxqgWksV0LAdfVrHO10l?=
 =?us-ascii?Q?SBwuGY/l4dCUOdva8idJdAZsALYYOWIdTA1EkYKqJ8UKyhzPgAR11lTTdDcz?=
 =?us-ascii?Q?GbeVSritGy3f6PVyCczdwo5cXoA01Dqcz/zGi6ujlW/h8dxpT1uuQsK5PQZk?=
 =?us-ascii?Q?uwrohKw6LeK7/09OxkazfXFl8nDr1VjoG/sZ/S6x+M2SFmJ166si+zjGtbM4?=
 =?us-ascii?Q?apKfKD3f+Gbq+k7cAs0TICykRijOrpJr88nOgMVhMmighhcf0cXAbE5lYygf?=
 =?us-ascii?Q?ln6qOC/HFbC4wrNwp6sSnDScbn7qanpuN7cRX63KhTUWsZ7nyG/160xlJ5rE?=
 =?us-ascii?Q?GdAUQajegVQ+iB/ZBFsHoqLQw2ZA89Szxu+z+vCq90MHaNdKJyb7Ctx5fO/3?=
 =?us-ascii?Q?znkLc2eaqS5RsDZbcl/DiZYTMQ6xR97LsOMpqih9POkxidr1RlYhL8QLPC2d?=
 =?us-ascii?Q?aWOIZifONbZ39RdJOytErM13zb2Vqtw+yLaMC6vt2e0R1ejOlnZ8L6Xm6ckL?=
 =?us-ascii?Q?pwjCGpwMwalhb3MfkiGhDCL789JGNGzSbE4jCdCdufBFkDJ+neHopwCFEoEw?=
 =?us-ascii?Q?EiQJS/AvBhbL48+iGAJ5kDZDwV0gAD+Q7fkOQjfD8bZtWqCUoHdbZKlOOSVh?=
 =?us-ascii?Q?zxHTv+vhxZZbmkAOWpOjuVKvgVLQW01xiiuKv/vBIDder1v2+jKXjp+1+1PI?=
 =?us-ascii?Q?RsNilXI/Gv3EHizerLE5e52+HDQIpp5lNvOYWkHc7vAOhJv7aHPj7Ik418/X?=
 =?us-ascii?Q?O4EJtXvYVXb3WLs6P6Zrz4edypnJ6z858B5fENBiFPGN9PrXHzklvShnPN/S?=
 =?us-ascii?Q?rW1Hg+aiskA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAXyvObHUj1O3fr5N/ppLDMlVjZR7/3hCxwxTWfXjSt+j7iZa5tMlgcaHC1x?=
 =?us-ascii?Q?yREm5pwOyYaqrEGk5fHQHhk2BGy0ATvA1NLAFtYoQq/QOcesYGHVLxWeTncc?=
 =?us-ascii?Q?RAX8Pr5ecH71lfE7CPSdJAErq2h/MDd6TjwyqfrqEw/9fNffxQVToS1MwahQ?=
 =?us-ascii?Q?mOppkRGXj3i7LZ6R0IeBZEOmtiuQDPnjL/yOlgkxeav12GLoy7oILpl0ZG+c?=
 =?us-ascii?Q?6fz8MhjsvQCH4JjxgpNUBybWaB67kXpPCTOgPrqyscSIbIT694UxZmrnuZnl?=
 =?us-ascii?Q?NcsBFez5avX0GMk6gNkcxl7jay7xwsAKXmYVXpOWEMcK7nH3bMsF9HXzCJQZ?=
 =?us-ascii?Q?XHoHiafWwl1706wF0Yuxbyg/UWGIgtQgkeZE48QUiIPzh/g3/qyjvJwxQHdc?=
 =?us-ascii?Q?3yYeeoH7gx7tgCIkNwQhcckfPrIZJXTheqZZnIi0O2g3Yjr7qwLXNAJOQo3s?=
 =?us-ascii?Q?bKUgqXVZKGAIXWwTc0DeRIKuxUjd98OAqkjrAd689ziAnWBfkbUp76QEdCVB?=
 =?us-ascii?Q?YVoEdcZx7vCqS9Zl05dD2xqcDygkHTIDfKjHqFXjsSR0YhD5lQj9+6K1zLrx?=
 =?us-ascii?Q?x/O/gzyajmTrJM06+/2Y4qwimZ5bonSXDw1LbYMF/V5OS8QPwG8luY9JB7Op?=
 =?us-ascii?Q?I9MsH2J4B473GChl+8hfC6L1AbQGbKf4yVdkvcFdGDi7zy7KHydYUhTertff?=
 =?us-ascii?Q?Al0NLG76mlfZI6pFekNRz0jYPipiIyT3OhXXlfOjhBd4BM23hwv0gf76rY40?=
 =?us-ascii?Q?pJCrRlGyapNrjNE93QChzOzBYRa5/C3VdjtjTmOjTb/HS/EW5HINsGKIqs1B?=
 =?us-ascii?Q?m+92BL2vuFwi0SGl7WpJFXvOSeWuD4mpNWvPBPqlcB3zOPxHxXFk1K6uNBPT?=
 =?us-ascii?Q?Lfouo9QB9EcM4+cS5p2CabkPD19NaDeD2x6w0x9wxedK0jPY5KguvcEyK6B3?=
 =?us-ascii?Q?WLH6c3uzrIUszJLuBodIwgdIP8KyATULNKVyDkBQ4/WDgEIVgaofYNgwyT9T?=
 =?us-ascii?Q?Tk1HOUMv5x4K8NEy1g5BYEw9HrqTJe+1bgLfpS8FKStngbTWgl+/SpIK+MM7?=
 =?us-ascii?Q?8PoIzjhIeRiabzn/HrpayGfsQu9CpvcT4gNsBPVkqWDHgbMaRQW0sshLZf3a?=
 =?us-ascii?Q?xj/ZwJdVN0Ewn/lMB4AXrpXJyQj1v+37+uWATHXVpTcyj/xYGUWvAafzqwwX?=
 =?us-ascii?Q?JAsUODmHMGXcRy+jgfGfLUrRvKYPFiqPvm3aFqFHymBXjNDIz9FqPBrcvwTt?=
 =?us-ascii?Q?DMSvwWvvSDcNBTa/h28+W3AB1ArxQAH+E0oHt6K9Lcv4qoSy6fh7xfASBlIx?=
 =?us-ascii?Q?dmRCDOBbcUQw/1c61TY01WmTc7EljagAMXt/E+9PylcUDkuAkVa0WCT+BlMI?=
 =?us-ascii?Q?UZE73P3cuCw2LOXR7/B10XDovn0NFss4E2S0/70W4vEdVHqwijlUfKXIR+S5?=
 =?us-ascii?Q?RqUERevlY+7coaz7KvBlYPB09reYyGBkarxG0W+668LOI8HU+VGC1gkKNgaE?=
 =?us-ascii?Q?pVZ9Q6yE2XYYMopkMoPjW5yDxACsk+GCayzEFiqvHx+jvFBRtfORGYxPf/YI?=
 =?us-ascii?Q?J+1fRqi5WW14Trc3zdfPMRlnT9Ai1fCLF+tLKdhMj2DyhElZ/qGpNdCZpiyE?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E+Lq460mz+Npy0Ncvt5j5YNGaB2x3kjxx3eVDJApvLatyiviwvodbDsJeBFtRY1y/BuPuoW4nS+IADPFMOa3K6DPf1csa5Vhlt5zZ5V6zb7I9APV6FW0LwCsy6vwMFRoWyl1hslcjXomZURTJDdw5RCE3ekDeSwb4uCX+PtDeD62v49PiL6mR1XE9JDj5HIcbD5yIRqAQ27wwxxevuEma2r9XfutYlikYJT84Hpr7obGSPzEGmOdPooVl3LEE6IzxQxH86qjoCQJgYm9TLnyJ1z3EtTaBdBniTMeNRMH9aO7bJl/GD+UDvF0rmwq+nXlhZT5jwR7e2fKX17wrhhR0o4N7tQM4eJkvHDtD3Y6DYmVQR6fFXDP0Xqp+ia1iJtefGCeN4jwI60yRqUxSWi60xh7w7CiZULG4Jojd396eTi2/UB0qk//N0DY9owyKT2kbmxajqxqobtymIHDoqXNHsoCaWmpRHSiK/+ZrMV+jlkfmBYgO2K2Ch/eA+sERsL+GD/NospOc1Gy437VrRyEV5GyypnHEaaJdd5m9OmpjXUKVT87npxf3Nh/YdK5gLOPhPEOLtPVQWI7bOzueMTAZ2mhCuejNPq4wglbwNpd2uU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7504aa-5c57-48c2-eebf-08ddb06ec494
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 02:53:15.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH1rOQZ9/OYJGpfQj54Acq6bvWLJVpvpgseb56dxhGPjvTijp9XX0z9muFi34XYdO1ou08AROzkCo8K8cFy4LDdWgasWJBhxwgSCZtkFQGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4481
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506210014
X-Proofpoint-GUID: l3-Ra-XqlSqgts4RBNonnP99LrWyPBcQ
X-Proofpoint-ORIG-GUID: l3-Ra-XqlSqgts4RBNonnP99LrWyPBcQ
X-Authority-Analysis: v=2.4 cv=ao6yCTZV c=1 sm=1 tr=0 ts=68561eb8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eb1tCNVJsZEqDWDkWxEA:9 a=MTAcVbZMd_8A:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDAxNCBTYWx0ZWRfX7XSsENQqNwZC EpoRdZduF5HoPfhnQBKGc2gmPSGAOF5iKqvqkQZpreVqy2jJMOruKBCC/pYV87gZ+VkUPZ7DZhB 09k+5FN/8R7EiaXnUWwoFsEN2CHm6Qyg1Tn1mmnhFEkb9R+jjfROQyH0UeEoM9I6/6kmaYiqONC
 /7HWKmF3EX2SC+8MqtYh0w0xsairAhGUx9nQTsDr/6sWjpknCbmGqp0GB7yxwVeyx9/JmNLbzHG mVgwimnOKjUQY1NYag7fyztMoElebDU3sJLzmqKDzGTBQm0XZRL4Z8IJsrkH68qvrHGHej1Zb3k yPrHw8e6ps7XoMEOAWMtCeBZOgNz/kDp6UJ5S4f/siNBx94StCzkiHNMOF73NvQ46AdPfH995md
 2mCBGbapCn8+y+drmeZCoSuLfhjry8ae1ewfQTtRhNnFSxghFBSn5/4yRBhoByX71ATd19gC


Eric,

> This series moves the contents of arch/$(ARCH)/lib/crypto/ into
> lib/crypto/$(ARCH)/.

LGTM.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen


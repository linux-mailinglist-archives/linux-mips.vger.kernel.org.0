Return-Path: <linux-mips+bounces-5472-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67768971E0C
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 17:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC35285290
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8C83BB32;
	Mon,  9 Sep 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0IMDUgzJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021089.outbound.protection.outlook.com [52.101.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2639FF2;
	Mon,  9 Sep 2024 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725895738; cv=fail; b=Zw/RiHqEFiPqB9whrJwSLwCLLxswlocTyVHi2u1YSbzkRmRYjQKrj4W1NLGbt8w33r7Vqyi1VwEB93sjqBDDNCxtXj8G5U5+yA8U4VFDYwox17YwwMIDEybTkkfJLHNFCe0KAb1FuMnti8F5eRE0q6xenRKDDEVbM3NVtiUw4H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725895738; c=relaxed/simple;
	bh=brCNTxvqLlO6luwBXnvBPT5/5xRBfWUFWym/D+Dx/zU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMMR8sCjDxcBujqMsk4xATZX85aLfIg9FLc4Qwe4qt5R2rlWNvugajMWiA4ldGEkZkS3rm9o6cXNz9UjFly+bPdYzdgymoBGVbz9z48wTYVYfdJZE14MPCuJGkSEBmeQ9H0dbwg4b9P1b2U0EmvW50KMz5f9kBhh9Og1puIvUg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0IMDUgzJ; arc=fail smtp.client-ip=52.101.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmOU8m0E6MepFaR1nvddEaO1W62tNyUrcCehSWm1XVGSgt79kH/Jch8OknUC4lDAt70NfXNrkT8jcdlwGt7KLsdI0aRrHxmUpcd/mL4y6q/N/7xx0Yeouk7AimPFx5j6izOFU8EiDT0vsfmkiqAwYTs6Ts0HgYWq5RPOgGaZb8ncFk8P2zOIsfrV4tBicTG5jizHnxmzB/2pzkwJJ0DYhygfRdmQTNjNhrwSrP3YbGcoxDrKZ5dDlOk3jlKjlxIsk+Bciie91xzXrzEymAKERDYeIcApJx5iCv9MLDlpnotFEHIrmqjwNkfJwPxaPCWdayvBMwMw+0GL4Y14GqOsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMH1pKuRS8n4PBZF2+aNiOnrmrPbmT6df2+gZlZwwGg=;
 b=f7dqFRSe03uJnmjkle28F63jjsDwxiCSIirpFBzOcEoU3doY9sZ6A/ZC+RfiEJy242yZJVD5o979HirhAxZ1PzirBqZhe0gQj9sELKybgIuBf6TlSoQzG4JhQIShMJaBF377spJPuJinQFsqWI+h4PtipyEtKcFMCJ/lYIvo/jcoBeOiNUbqR8c0Iq3DG2W9d1WbNI2UcLb8WkxQQCpn/7APF0vGYInfVyFqSVL4dzjUX6JF9jpEigOIGn3LCwfsh2jH+DACs92qMXS49ZlElsN4Gq+Swc1m6kxPfW81dAHFKJscVwsZrV+s+BlYURe/u84JG88vIiMoCk7rV6sFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMH1pKuRS8n4PBZF2+aNiOnrmrPbmT6df2+gZlZwwGg=;
 b=0IMDUgzJYxo5srcFgAdp6YuroFieJG494Lkw2T++yT2awXCs/TeliaKUWkx4B2QOuIMWzhVpjwXXFO8aOKAX4xrro4uBk154jbCyjfKPDQlRM/f3M9bqOPcxxXKkjxqDM4Nkp3hlbIfSyUCZCBBYsx/5/6Zf5CzB6j4Rj1Y7OxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB6715.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 15:28:49 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%7]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 15:28:47 +0000
Date: Mon, 9 Sep 2024 16:28:42 +0100
From: Gary Guo <gary@garyguo.net>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config
 option
Message-ID: <20240909162842.10df3409@eugeo>
In-Reply-To: <20240905-mips-rust-v2-1-409d66819418@flygoat.com>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
	<20240905-mips-rust-v2-1-409d66819418@flygoat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:5e::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 374cc072-dd63-4f2a-85f5-08dcd0e41966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N6+4NGXOWWxnmVctld3kqCJLvnEjgQSQP13aqYmIMbKbHJ79I7OspgS+xcix?=
 =?us-ascii?Q?dSHK3a2TylcG66SZ/dTTvXBwkZ2DBmw9w9o+7IbcCo6faPm0VJ0q36X+ZzeT?=
 =?us-ascii?Q?PfcfzVv/8mzgNpsKW2OUNumLdRlUTwgq+6aEbotG5mxfxCQ+eOM52mqrXsh3?=
 =?us-ascii?Q?+ih+1NToucFIOXnAZsTJ4M4gnE5mfb21chdXKqym1g0Y8FSykAymXZvStk9j?=
 =?us-ascii?Q?+9OW00GGpidJjtgtneM28tdy7nnxWW77sZ3ZUy/ZPlgOmQhpsXD8jUsckjSA?=
 =?us-ascii?Q?zpImnrh2BHbA0ipkeEYB9qEsoMpTE1Y4nJWaOHpJBe69XC9VaK/JGTZlC5+0?=
 =?us-ascii?Q?88swCvbb80+38Ced2kSyUwt1A+MvP6djHqDJT8df1S6MW8Yn6DnEkBO7eCjQ?=
 =?us-ascii?Q?fJy7B9xApNYUVkoRCNcQPlc6A/hl6M2yhvBAGNyBie3ekF5MOqLRe24vpQmT?=
 =?us-ascii?Q?RWBcQYREd2XIdCd5h/gsovs6sKlu3QruWA+ES2aPvCoVJoE8GQhoC3G7cpWt?=
 =?us-ascii?Q?luJH4eJKYvQ3lGx34tKxeEK1lL3AbD+MZMhfjLN1DZRVZPKr1mHnCbzFFU6Q?=
 =?us-ascii?Q?JhecVWkfGcn7/4cHGe4i+D0l4tRxrYt5Z7Z9NQLf6D/UL4JFlJGFX6KRrswS?=
 =?us-ascii?Q?xi+/4RadvpdsiylxgEviG3DiSZsYv0pMxfMKDBgj4/6y+MSwuW6MOMNVDqN6?=
 =?us-ascii?Q?ezal3Fg6ufBW33Z92YZ2h31ulOlFqatU4GwJ5dCqIPhHFyuoz3xcMCBHVnCU?=
 =?us-ascii?Q?M42aSbJWcmSQONwpA+BPwYN9NgPC9Itr0LPjxvKLfvkxE9Znudn6JLU/qRE5?=
 =?us-ascii?Q?5WG5549X3JNrHeUZvmEFJ7wf5MWn+t9AOdFObVy5Kf6T0b7pMj+TxgbX619x?=
 =?us-ascii?Q?2pM81joEgEnpt78p0PgJTuYOWTNSJeW5mDM+KccuZ+y+7q1hpPwACX5qIuGF?=
 =?us-ascii?Q?cj2DBXSEKZVOyaIuBooKKbTa/hOmFFRnwBz93ilg0cyb9LXsaPVDKIPMBb7j?=
 =?us-ascii?Q?0v5gZhuzaOogwmJY3r6Js/MJdNKHu4xbecqNQBYXzoLkFpDpBju4TC4jgIb2?=
 =?us-ascii?Q?SphiRA0nUSl+ybwAl2i1PuePVyN+AWwgBfwg5b+Rstw8g3ycKaoEFIVZdKJi?=
 =?us-ascii?Q?6OFZy/hq1aifodL2RYMgNTZpopF/zvNVMMEufb1MA/6KAGIAfBtKKWMaiSKG?=
 =?us-ascii?Q?FM2l6A0GHxIM0TOexvQQ18W/QDU+gwbVa9KJkDwy51tZalgRGAcJutZM8Yh3?=
 =?us-ascii?Q?0dOtgGgQ5iPmNZYXEM5xKBdnVuXqEBTvxHEeA9zOoKVl05xx1mKyJpeOLItE?=
 =?us-ascii?Q?h3fvHmRmA9YGCgwna8LHukz/lnPp9k54EA+JD804IWjkZqEzWs6fwxwjBxxB?=
 =?us-ascii?Q?dPA63DQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ePtxfMiCHcHZXg8DsnA/APm+H1k1pv50ubX9txvd49/QLCLaX8mIedkm52Jf?=
 =?us-ascii?Q?7G80bCW3D+MRNkT6gt8mg1S2YmL3rJSWN0DD0xqtSm/Vm2Gs8wBiDYt4Esr3?=
 =?us-ascii?Q?6lOXy/RkhOJV7S9iF2fd7z7hVVYBoqDo5Ga0FYXRi4FLyc8z4ENBdRUqaiWc?=
 =?us-ascii?Q?zS1LxD7w70OWZhxNJy0kAfygsZFv7ei2vuCU1AA3ztIbZF7xo/hG+lBJBQV/?=
 =?us-ascii?Q?Z2qvdgSORg/q+jD6hVoHBkIrzvr/BkzRMkK/j/3LBTSYvPuEnFiMB/zbqrql?=
 =?us-ascii?Q?meNfgXBTeLY0jqMwqGwCjFBnypcRGAzzK/TBPw/AZgLOVF+MOJKhkOaiKnlW?=
 =?us-ascii?Q?zODKwvix+W3XoNaAVmj1S6subA77UvfTzRrGLwnWW4hXS7LhzzDrzNcu8X9h?=
 =?us-ascii?Q?us1TrN46sLy+cWnl1WP5pAHGn0D5gTixA2dZvLAHfiSPltj89cEjpitJC/BW?=
 =?us-ascii?Q?djCpAscfjxav+slM3U/ONr/6imLvIGy1XUI3Pd1WOmbm2tjnTvP9uBGvGRyl?=
 =?us-ascii?Q?IPY+PlcSJlyYA5j5QJjz3P4deXX2G0LwDyXJJDyo/0cLMdldAed/vTFjPk/4?=
 =?us-ascii?Q?gLjJUDi8Mczumvu+Guo0ICHAp1JSsS6XONF91+T7/K8lX4ZPiFveSAduJqck?=
 =?us-ascii?Q?W1UyH58HNQJ2kIF5XLCSfYCLWdqs27uud3loldZI6fJsqWgBrlq+4fSOrS52?=
 =?us-ascii?Q?svmZtbH+85ldxKPsLkoWKpsfnpGiSQWqiFy6PUIX57+qjibYkNvq/0yMYgOj?=
 =?us-ascii?Q?6gD2e3ie8Xu6UtEBMp1jsx84ZAgkUIPlQZOlHskgvrQ5UqEUVqG8dS/FkEZD?=
 =?us-ascii?Q?+gNA8WdyXYvXJORbcNa5eC/GUiV7gJef2w44G/MZSHhCNGIVWI7iYN/PtLhF?=
 =?us-ascii?Q?ej0KJFJ2nvcz/kGJ8c08Hmv9Qo8d59bfqXkzyHyNvtn8KxEZGCp52hxusLF6?=
 =?us-ascii?Q?pXzqzPVigO6dguDVvhVdIMhHDNjefwM5Y9qqDY2zDGwk6KSRs9Rt2letojts?=
 =?us-ascii?Q?3NnXEB+At2aCIrg6yv+LgkHETVU0P9D1bm7IT1mspga/9yog6LFqtGDWesIq?=
 =?us-ascii?Q?HhxjqHYu4v1av7oA3G8x4rO0uMGGId98hlotxb820WQd4r3rUdcMJEw6nadh?=
 =?us-ascii?Q?ZVqVu280BXhKusjZOHnPEND2DCcionEJXU0EJ36rSQ/bAsrzx549XhbNbm8W?=
 =?us-ascii?Q?H3XIo9byaOds7Z4LR67Gn15lMu9wcULpjdmCThsEmbq8sUDNR8wBmcxjDg/D?=
 =?us-ascii?Q?rWJszLslCEtMbF3+LFTF50lcp6u4oNWebeoRi+UdLiMVOOoL1orAXDSV+qKn?=
 =?us-ascii?Q?dVvyPY6hMLmkvtzXeFpVYldr2FVy9qxPzDjFy0VleJuQ7xFArbbzot9z89fI?=
 =?us-ascii?Q?1x1CqV7Z3mG19sH5NI1pv4AfIBOzqJ6c9p9yw3VFtl638mqkqTJ5cAPNQQB3?=
 =?us-ascii?Q?CT2yBlOGQWoV+ZPg6C3VQSLIUzeA5yF3ySL+wFm0nw7ZXEbgC9pjmGZKlUeW?=
 =?us-ascii?Q?G4iQxoe78ck6pbtxq/BzL6JySQjYuy2IJ5Q1GIctbCfSAfoUO7r+JSfUm6eA?=
 =?us-ascii?Q?DmYjD5WU/ZYQGwU+7HFC+k7nd1ynvFpcMpGRvPsF?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 374cc072-dd63-4f2a-85f5-08dcd0e41966
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 15:28:47.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x59Tysi1EgMgwyQC6KmtYP8RwtOCICSpfOCn9jH5QndMlIrU4DWQqVf+Jpx1GHWL70v/wkTsDaoJHe/YMKZk9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6715

On Thu, 05 Sep 2024 14:33:05 +0100
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> scripts/generate_rust_target.rs is used by several architectures
> to generate target.json target spec file.
> 
> However the enablement of this feature was controlled by target
> specific Makefile pieces spreading everywhere.
> 
> Introduce HAVE_GENERATE_RUST_TARGET config option as a centralized
> switch to control the per-arch usage of generate_rust_target.rs.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> 	- Reword Kconfig help
> 	- Remove x86 specific condition for UM
> ---
>  Makefile             | 3 +++
>  arch/Kconfig         | 8 ++++++++
>  arch/um/Kconfig      | 1 +
>  arch/x86/Makefile    | 1 -
>  arch/x86/Makefile.um | 1 -
>  rust/Makefile        | 2 +-
>  scripts/Makefile     | 4 +---
>  7 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 2c1db7a6f793..b183855c34ea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -807,6 +807,9 @@ KBUILD_CFLAGS += -Os
>  KBUILD_RUSTFLAGS += -Copt-level=s
>  endif
>  
> +ifdef CONFIG_HAVE_GENERATE_RUST_TARGET
> +KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
> +endif
>  # Always set `debug-assertions` and `overflow-checks` because their default
>  # depends on `opt-level` and `debug-assertions`, respectively.
>  KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 4e2eaba9e305..0865ff4796e7 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -377,6 +377,14 @@ config HAVE_RUST
>  	  This symbol should be selected by an architecture if it
>  	  supports Rust.
>  
> +config HAVE_GENERATE_RUST_TARGET
> +	bool
> +	depends on HAVE_RUST
> +	help
> +	  This symbol should be selected by an architecture if it
> +	  needs generating Rust target.json file with
> +	  scripts/generate_rust_target.rs.
> +
>  config HAVE_FUNCTION_ARG_ACCESS_API
>  	bool
>  	help
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index dca84fd6d00a..6b1c8ae2422d 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -32,6 +32,7 @@ config UML
>  	select TTY # Needed for line.c
>  	select HAVE_ARCH_VMAP_STACK
>  	select HAVE_RUST
> +	select HAVE_GENERATE_RUST_TARGET
>  	select ARCH_HAS_UBSAN
>  
>  config MMU
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index a1883a30a5d8..cbd707f88a63 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -75,7 +75,6 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
>  #
>  KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> -KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
>  
>  #
> diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
> index a46b1397ad01..2106a2bd152b 100644
> --- a/arch/x86/Makefile.um
> +++ b/arch/x86/Makefile.um
> @@ -9,7 +9,6 @@ core-y += arch/x86/crypto/
>  #
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>  KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> -KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
>  endif
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index 99204e33f1dd..fe3640b98011 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -378,7 +378,7 @@ $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--re
>  $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>  	+$(call if_changed_rule,rustc_library)
> -ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
> +ifdef CONFIG_HAVE_GENERATE_RUST_TARGET
>  $(obj)/core.o: scripts/target.json
>  endif
>  
> diff --git a/scripts/Makefile b/scripts/Makefile
> index dccef663ca82..33258a856a1a 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -12,13 +12,11 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
>  
> -ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
> -always-$(CONFIG_RUST)					+= target.json
> +always-$(CONFIG_HAVE_GENERATE_RUST_TARGET)		+= target.json
>  filechk_rust_target = $< < include/config/auto.conf
>  
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE
>  	$(call filechk,rust_target)
> -endif

Wouldn't this change cause target.json to be built when
CONFIG_HAVE_GENERATE_RUST_TARGET is selected by arch but CONFIG_RUST is
disabled?

Best,
Gary

>  
>  hostprogs += generate_rust_target
>  generate_rust_target-rust := y
> 



Return-Path: <linux-mips+bounces-4032-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A991CB25
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 07:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17671F23767
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 05:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF99620B0F;
	Sat, 29 Jun 2024 04:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mcK/EMvC"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010006.outbound.protection.outlook.com [52.103.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EA1D52D;
	Sat, 29 Jun 2024 04:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719637157; cv=fail; b=k+RjpZ0gTWjOJFOJQ/dgWKVHXy+ynQQeKhmvusp2N64xuWpiymRONBmj4dWSkuSKD3we5s/mziaVRmvoXAziy9somBJ1a+EjUp9I2CZ74uKWu++Xml6Njku6n/7xdgR2BSKTd67xpLRjt4nP9IkrlBMGLdHdNAhGe6E5U6vKmx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719637157; c=relaxed/simple;
	bh=33Si3f+mOXiJy5bA0uzrLMFokCQixm1hYtCcmwhkMFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kgneyAS3AeHJPoA0LSOcp5XXiwbFw2gtaplpb+1RZj4V6lTPdjkPgAmOp5sN0f/Qz6aMeAz7sHzvsk4I7nq7jm2J84pP1dHXilLsbZK1nF/tRzHoPSVIIscJ7vxnMGdV68iVcLT7RNMKcA1COGvBkrnfmfsry8KfFnfSmYuTdIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mcK/EMvC; arc=fail smtp.client-ip=52.103.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azOVPvdWg2gP9t7Q7ZzVPi6zgdONedn/dVbnGVR4MkU899Fdlu1ex16rdfUYhiRyvhnR6rt0VnO0NV0wzoocCKj5P7rPii5doLyeBwdg8dwqYuTqMx1DceIbsoaYXldnVBkrHnQNkcw5WI/GCBFKww6I9dihTISWRbu5PTPMjoA2d+GCzbkA5GqSPcM8jQXykfQEnfRYC8ZhubBi3je5kYNKjRxOSduCYCbZ8j3NNl2feC5Q+zPPakNRtjEuya1C9zaB74B6ro3LycbAeNTKCqNC18sTJBxA44+Pckx4aRyUDZSMuxEOoKWqhOorhA+wfhRLqS/VSE1FON10Pig4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql8OHgZnd3XUNuK8X2KVFxqMF2N1HFA0ONBjLRgWS/w=;
 b=c8L5EYOOfRftGty4wd9vraw7jdXhTGLEAPlsYnb49sWRN6INqGzEZA7Gz8meg+T9qOzUN4evxYsNFyL+8FrvlxbSxu7hAeuzq5XMPomt/yaqbymM06mu/dXSP2FIkxqHxaPJPtWnF2ojnojCrqvVwdQZIJRflDjRSVZhboF5e9oDZjcY/Nd6aTITlDYi0GRktv6mqHsf1bsJ00ZnPnpfq/3OIZBnLbuoGmCe+c0BZ3AO9MUb9exDUgN3vF6Jw+8oVdZ3rkdBJVl0G+SjJ6uxePQQ+08XH+yFdPBbzpGjo1SHOiApARavMNJZwjcOUmAWGq6aIdadyBTgtYX5G53gFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql8OHgZnd3XUNuK8X2KVFxqMF2N1HFA0ONBjLRgWS/w=;
 b=mcK/EMvCILQg/6tteTSpx3rp41nmQGZwhth7mtWORKnyJXAj1YBgAN5lOKDSpmrXa2drXz1Mer5T5Aemf6VM4jt2bXeW3nWVKoqou/wxgIFHJ8x59PghJloVDFQIaVYvLSJ41xxw1oIG0S+qYRaCO7mRj3ZS+Bv4gWBShHOaUzxJJJAaiaAmEGu6CWNusyxPVIzrPWboqWZObXYDR4Ca5vxDrUdDYZmh1HV+6Ldl/bxYE/k3Boh4z0D1qRHoEZkclT09UGXna48MpoyjSfMRsKeNg7yKo7qnwY0MxS82xEb7jnNGU3SM5GvO3ENMMXwxXBaeJ6nL0M83cEv6KoSKpQ==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 OS3P286MB1829.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bf::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.28; Sat, 29 Jun 2024 04:59:12 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%5]) with mapi id 15.20.7719.028; Sat, 29 Jun 2024
 04:59:11 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: jiaxun.yang@flygoat.com
Cc: arnd@arndb.de,
	bhe@redhat.com,
	fancer.lancer@gmail.com,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	khalid@gonehiking.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	namiltd@yahoo.com,
	tsbogend@alpha.franken.de,
	yangshiji66@outlook.com
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Date: Sat, 29 Jun 2024 12:56:39 +0800
Message-ID:
 <TYCP286MB08959A6EA0BCB900503BA18EBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <0ffe69cc-3a82-4d2c-86d8-5ab9b176ce4a@app.fastmail.com>
References: <0ffe69cc-3a82-4d2c-86d8-5ab9b176ce4a@app.fastmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [TNPdsjdDW0E1H1zMMfvLm2zI5lo0yvda]
X-ClientProxiedBy: JH0PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:990:4::17) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240629045639.11057-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|OS3P286MB1829:EE_
X-MS-Office365-Filtering-Correlation-Id: 803ac03e-0c99-42c2-54b5-08dc97f8373b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	oHUwmCUG4qiPoq+9geW98kNY1mgILW1/DSBROz5z/BuBCubvo+lEfkAs+GF2k2mOTKTX6aW9JWZRRl+tIdHWRhWmo1cKz1poisQzI7RegzEBlDZHtK7FqYkYgRByG4+AEIpBHXJj7SpTEzZ55+ThUy7iwdsb3R5qLaeDZClA67U2y0KtA7PcMmxPSmHspE3s9gzXdlFlmp0TKxPmp1WjUiGLo2hoKB5tgOuzseHA/rP0zkos8Q3vrBDf/KdA33qrKbowVzRVJ3fK+FZLHEFGQK0u6e4KElMX2basdcY6L79M34VK1tKxyIPVd14H9HKkHeM7MukCJh696MkLC8JL66bTZTkxj9UtHR5DkawFeYuQgw95EUp99WUwzZP1gXfEOgcvNmQU8sIHZKQXmZJZcNjTsUaOZUBvWH0pVP8DW3GT78WlN3w0iwMtBLPoxN+yjGZ3RouKILDK3t26DOrCbYl1YosDd1Sz1eEJtzvqkShGqpJGElHys8A2t1ulBKTn8lTj4U9rOnjTt9Gj+cFz685EbjCCy1dUWJ9he/2H0tDgS0ak7X15MrypS4zD88uvTD9uyT+E7R4P2D+7gmyGxLmJ+nZGWL+KijBUgrWBMemcUd7DxyZiqioRv2qGnYGEvqr/Jh2hdhMD0DlL7V7ljrdvgRnugtoqr2ks4kFoBBvSKeecHk/nMWEOSfd/UoTZGYjqH4baZRGc52fHgJ82BqbF9ItPKivHAkt/8fBmsoboLe/eYwQK89VYofGvYyBK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S795QD12mW3b25BFRexpojb+o52397gyIovdFeTODYtEo9PCyH2bjPrl0W5F?=
 =?us-ascii?Q?LOejXdyLp9yAfF8olE2UGFZ7zUTmT4CP2gC1ry1hwtuzaUEUhyhLJ1vwrz+G?=
 =?us-ascii?Q?POII6Q2Xc3yXV/IV53gSsO3iueWd8qzGuJjE7jA6Tx1KYeS4rHvrFcO0k315?=
 =?us-ascii?Q?imW1PIPnAEJklvBbFXsmSLYFFhDIhaz1zKBE7zFwsKNnz6vj9MxKcwARIrhw?=
 =?us-ascii?Q?tblNKXU15lEmo5Z/nFENV8GSzoSInvgFwhKin7fG8JRts4w1+R3gJCXBEVBN?=
 =?us-ascii?Q?XkbNAUQQ0ALN5l0LYQFSX2gAsczg6xU/bEOoDnRINfj0zOKz8srhwgro2AwY?=
 =?us-ascii?Q?BZlMezTqJFq3xdAzD6CARuhKOcsuiYEAoITtXvtoNZGcMNclwd0OzRGCnZzE?=
 =?us-ascii?Q?k+mftB6DmVn/KDH7mZEjmCuQpNSdcZsY4CA87IRYqbOhfIhhiFclh57Yw1ol?=
 =?us-ascii?Q?Esdp7zpfgoSADJbh3s93inn6xapBpP+ydfeO0Za09rXbCYJGgBCygY1rIVmY?=
 =?us-ascii?Q?/jYJa55JEFjSoR5sIzVNOcAVyFNCBDHyeQM8HxOOeuN4+BnQkV7lWxNExh1x?=
 =?us-ascii?Q?MY3HH10FYGVuuRQuSet45lkB8TevwPxcPwWLql72fVwNZIoNfAQ0LY+I6YhV?=
 =?us-ascii?Q?EPo3DExEDtJqu74mTE6ZxYRXKJK1UA07gNCCiGBMDhCfSM8waHFejESFTaJA?=
 =?us-ascii?Q?iu7KcBL8fgyo3AGSKaRoHQkYNIoQyXLZjNKApXy2lREA57FWlTbnp1ECWWrT?=
 =?us-ascii?Q?1fUWWSPqd/RDsRlNHB1IFYFFtBKUlMLoW2TNtlyWKaf7gq/JLJWdWIuPJxpM?=
 =?us-ascii?Q?9PYRtIveJBPDryDAH8cXVvrSFn+N13AH39n7i3RGZL7QWXWyd7gy1iVUx7xs?=
 =?us-ascii?Q?kXouMJOxzKSq7AuAF2I/xYAN/VJRXqR89Z7upuj5OryaaKFryoOFDox4zJ7U?=
 =?us-ascii?Q?0XPbepv1GErOMG8Svr8bhGv2VobfW8lO60FPvfx+zSF0oZM90dgl7g2ZtIl8?=
 =?us-ascii?Q?STlMTJPyJQc1cK/uoXOhCIodj4ke5ndhKbtu7fnzD+PKCSwb1UFP1l7ReFZ/?=
 =?us-ascii?Q?mZVz2CEznCUp3Apq+urvP6vBXvNUi5g2ZgsKULpa7P2PRW2ku9VfgiLSWwRW?=
 =?us-ascii?Q?O9dOgl7tmAWWS/P8Ei4oL8Fa/PQGD98P8UCPN8xurzG4dQrHvkiRxZO8Apzx?=
 =?us-ascii?Q?IQ1zSTguNRIQdXJdHs5yqxV3ab8hzwKThjmOIPb+xx+2f7U8CHlKJ7r6uVKL?=
 =?us-ascii?Q?XLdwIW2f5y93GzRN8fpy?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803ac03e-0c99-42c2-54b5-08dc97f8373b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2024 04:59:11.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1829

On Tue, 25 Jun 2024 02:58:54 +0100, Jiaxun Yang wrote:
>> The detect_memory_region() has been broken on 6.6 kernel[1]. This
>> patch fixes it by:
>> 1. Do not use memcmp() on unallocated memory, as the new introduced
>>    fortify dynamic object size check[2] will return unexpected result.
>> 2. Use a fixed pattern instead of a random function pointer as the
>>    magic value.
>> 3. Flip magic value and double check it.
>> 4. Enable this feature only for 32-bit CPUs. Currently, only ath79 and
>>    ralink CPUs are using it. And 64-bit CPU doesn't have the KSEG1ADDR
>>    definition.
>
>Hi Shiji,
>
>Thanks for your patch.
>
>Please don't break 64bit system.
>Use CKSEG1ADDR_OR_64BIT instead.
>
>Thanks
>- Jiaxun

Thanks. I've updated and tested it in v2 patch.
https://lore.kernel.org/linux-mips/TYCP286MB0895F65439037ED134FEA7DDBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM/

Regards,
Shiji Yang


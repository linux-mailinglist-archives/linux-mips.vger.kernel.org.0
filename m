Return-Path: <linux-mips+bounces-5473-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC836971E1E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 17:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AA411F22DB6
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 15:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C826A38FAD;
	Mon,  9 Sep 2024 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="znNWWXI4"
X-Original-To: linux-mips@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021112.outbound.protection.outlook.com [52.101.95.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9B7494;
	Mon,  9 Sep 2024 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896066; cv=fail; b=d6ducTX6bKUAPCoPLFuUGn4Rv4bDhxisFIhaewCHTE/u5XnZO8TwOsmHwrNWRLQ8eXzlgxMZzQHEm1StpWRRk0QfzFQhZ9YCvhcs8jOSBSJ1UjP017kqyS07uy8wti3ib7gBSY8GuYBW6eWzIi/UK1dyuKygOPEBzkxwq9CmPZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896066; c=relaxed/simple;
	bh=ERDk2jTBJ491M7U4dG7BMl2I7o2/uJl70GO4MdeRbwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PR4edahwFQcQJ3OGE2huwsJm5ViEJME6sVb8PjKv+CV46bgn9ejwnSCaHlyHTb5EGzTuGPhBkMONT09/vRwQ/+87oumtJPZvhM5h1XYJf+krI9GgDKuKrj0r/HrJ5aB8jRoKmtR9PsAVXPlDFLdaDmLeR4rtujHLFkrCaCTsUVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=znNWWXI4; arc=fail smtp.client-ip=52.101.95.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aldz5j3dfm2UTxgMWYtgPc113J8jPHecR/9G5x6zQ/R2Qxydz+uerL8hccOsyEeyTnH27pvZCEDS3t5Lry+5VEBHLiUKJ1V3ChpfbRbgagFqjDQNOfYabV2HldCbtJuaDlhdiFBW3JeF4vbGJ8r2nkfheuZ7+yv70ZgtsGbJ1EaC56I82rCahuFiMxXXfLwbaLH6qr66gVbthSF4u/6kZIZ91VElGQUNoVgNGrKJVP25kLxZOYE0hhOc6oWN+Wg3wPulNdTGJ9P3c5GM/0u+d2Ki2Ny7mwfGy+smbVG5zZuVjLRQPxbR+I6fwOeQIumtx9yqVpKrcu8me0gYKzJeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGLaW9qoWJsBWV9TdGjxrKCpWj7Y0e2Q9QCP5L7IMt4=;
 b=dCpyz597xuIuele4A4+OE8FsjzpDPu67KPHhJwBGU6tpq62qU3hVQuwajY6bXa88Sn1ttne+WLodQ/f4SzE+hSvqO/cgkIU/rsCvSBqGe5fg4YBZzkgFtx65Sx6K2SEkJMlTYct8oIvABo8VpNdpIlExZR9h5j7O4AcQrP4FmfhN5i5a7H4IPknGMAI17nbjbrB7pUsYbKEi43Jf2hEYstrTqRZldnnwwGvoyRv0pnmZT5y0gVOu/iHATFhDonuktv+1FXQgiqJ2BBD+lGCUjRu8GIooobOKHe51w6g0b5ww1fSkSgGfi/6PxY51qfakpPVx6XtpxYr5YB1aQwtICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGLaW9qoWJsBWV9TdGjxrKCpWj7Y0e2Q9QCP5L7IMt4=;
 b=znNWWXI4cQBXCsJ3Zo/Fax4g9tsmjU4atr5PhBpUylgc28BOrZxALt3o0iBesaphpOaSpNvf4Zdl+G/+WaTyO1DBqz5Odk79gBVvD6HiOQjHXBUaptv8Gkq0PsxZPPQ5hOM42dyctOxjF9TcuI2LWmA8UR57KYxXWAdm+yMCU1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB6452.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 15:34:19 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%7]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 15:34:19 +0000
Date: Mon, 9 Sep 2024 16:34:14 +0100
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
Subject: Re: [PATCH v2 3/3] rust: Enable for MIPS
Message-ID: <20240909163414.66909716@eugeo>
In-Reply-To: <20240905-mips-rust-v2-3-409d66819418@flygoat.com>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
	<20240905-mips-rust-v2-3-409d66819418@flygoat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CWLP265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1d4::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca029a5-4106-46ca-9471-08dcd0e4df0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE14Y3QyZ2loL29BRlVHQS9JVFQwUjA2QU10TkErTGtNUm9LSkZYbjhhb0ZS?=
 =?utf-8?B?eThLWm5RZ0xleVRxSWxZamszaGtmclhiYzR3WGtOTTM0ODhLYVFEbkZyenBh?=
 =?utf-8?B?QUxYTHFiYmFVUjBGN2tGUU9QY2J2cU9BWlEvVVJLZUcxd2RRY3VxeXRRZUNS?=
 =?utf-8?B?TWVpR2dubHl2U3N3bGp2V3FwTTZRUGJacHJvblVRcjN5ZWtES2cvYjdCdzFw?=
 =?utf-8?B?dVF0aEZYdzQ5ZDdFN1JwYjd3cHc1K2I0cnI4NURhWlRUVGpPd3pmNmJqSkt2?=
 =?utf-8?B?YjRqejBsWXFBOU1oUktyM0xZWXZPcm8xdGd0cTdmZXVWcHJWZWIyV2o4bWpW?=
 =?utf-8?B?Qk9sUXYvTVBOVHF4RlZzbUliT3NSWDFoM0owblU1Rm4vVmNtb2Q3dHdWV0I0?=
 =?utf-8?B?bXZoUEF3OEM3c0d5QzdlT2NLeWd5bUNLSGNDc0pnd3dIWXpEQklpRlFaVzNR?=
 =?utf-8?B?RXBSb21VSHhNc1VEV2tHOG9qSTY0VVhQbm91ZEhoQ1I3SWZJZWhiL1grM1NR?=
 =?utf-8?B?aEF0THhIR2gzL0lIZHZHc0VRakQxUVFMM0pIcTZLUVlEN3NxSWNZSFVzZDdK?=
 =?utf-8?B?dFZ2VFRhSlRIRVV0aW93T2R1OHp2eVAvMWFhUEt0RlhLNC8xQnB3a1lURUp4?=
 =?utf-8?B?cVJUaGdWVzI0S2k3V0RRM21mZEZiZ1FEWENaTkdvL29PSk1qU2lNWXhjN0Zy?=
 =?utf-8?B?OFpQbGZJNVFlQ0w3d1ZOV2RJRnYxSEtoNC9MVzNtR3RGR1hVVmp6YXZWMTl2?=
 =?utf-8?B?czVzL0d3Q0R4YTkwM3RQcFg0Qzh0MEkzOFlTNEV6TnhCT0xobDl4ektGV2tv?=
 =?utf-8?B?YlBiK0FTTmk0ajFQTzJZYjRzOU5sdEM2RTJlUU5UK2tuVVpYbThmS04vcWNx?=
 =?utf-8?B?alRuZHBJdFoyWlhlai8rUVRwWlRqRHp5dS9BZjZUT01EOVBXK3BqTDVZR0xI?=
 =?utf-8?B?RDI5Y2thTmZWWVdzbXUrQ3A3SzNmb29qaklrU0lFU1VCcmZDTmRuSnFpcC9r?=
 =?utf-8?B?NkhvSzVWQkNyLzljUmZFV2ROTHZYSUx3VVVkUVpkZnlVcE1HREV1di9KbEla?=
 =?utf-8?B?RThJYXM0MXorYVR6SWE3NFM5aUpoWjJKV3JNeGZqMXMrZ04veXIvSGRZNXRo?=
 =?utf-8?B?OWk4YXdtU3lBdXAzRFVGN3VicDF4ODZOK2pFNUI3bVI1LzRzZFM4YmtKM25j?=
 =?utf-8?B?UVFBWThXLzF3ZDNacnNiQi9DSjRaMHFHNmF2bGJZc251dU9Xcmx5ZlRFYXFT?=
 =?utf-8?B?RmlMc0cyZzJmYUFRV2R5QjlaT0ZlNkp5T3ZPWGpyK0ZnRTM1djFLRG9mZk9m?=
 =?utf-8?B?aGVGR2xxTVo5K1JDMWVLdVI3RnBmUEpRMmxyRzhIZDBERUFyLzNKR3BYKzlH?=
 =?utf-8?B?WHVtbFBxS1lRK2R4aWI0em9qbjR5UXR2TWxDbC8xSGxyVW1aTEtpUXZLN2gv?=
 =?utf-8?B?MTRqTkJFWnJraXNxZHBrUCtpYzBIVFVnNVZieTkyVWt4QzJqTFNzUGpSckdp?=
 =?utf-8?B?V0Z0eDlpaWJ6K2NxT09HdE5DZldjeUQ4OHBTMTNEVThNd0ZzQlRiOWdSaFlq?=
 =?utf-8?B?RENKK3A4ZldmVUNtZWNvaFhFVjNMa0VRMVYwSitrVHJMcXF0T2l5VHhKS2pH?=
 =?utf-8?B?Mk1pVTlNT1F0cHVwVmxic2xSdU1VOFFUOC9TOHp2L2dlV1hOa3dURTRUVXli?=
 =?utf-8?B?dG5xZSt5a0ZFZ2xDR0IzeXY5YjlIZjEvbXNQdlZaY0pRblhnOG1jZ0srTDhy?=
 =?utf-8?B?MmFzb0h5Q0UxMU56MkdZMk1Qbnd2K0VGdXpIV0ZNOGNPRUV6bW5xN29aQ3Nu?=
 =?utf-8?Q?HYHcqYdckmgfIee00cYLt6zXIUH2RDfbDRBUo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5QYUxmSHNCSXludE1XZ1lvNU8vVXRwQWxyeGxlNFNveU5lY3Y0UStyM093?=
 =?utf-8?B?TFYzMTVIQVlJQ2p1Vk8zVDQ1YkJ5MmhVSm54dTRPSDJEWnlCNTByVVZxWWlP?=
 =?utf-8?B?MDljYkJmVlByZ1ZOSy81bVZQWmRqdGdkSmVKQmJyMG83SGlWM0Mvb0FGeUIr?=
 =?utf-8?B?WjE5RlF5UFJ0VFk1M0RPZU1sY3diZ2lNdW0ycnBmeWtyR0dtSnBEbHFDalhh?=
 =?utf-8?B?cThtRmpoRkJhOFB1Q1I3cG45cGdTNzUxeDZGMlp2WGluWUdUS0FhOU00bW9r?=
 =?utf-8?B?TWJXKzlZS0xmNFZ6WTNKSlNaMG43YXhyUjZabjIxNG9sbWRQM0xwSUs0MnVq?=
 =?utf-8?B?RFUrYnRCWStsRkVVb1Yvei9MTEhOeURja1QvWktvMnFLNmVUQ3h5RTdGbkJx?=
 =?utf-8?B?SzJabjRaVHVnVVRTYmhIckFzZkkwajhGdDk1bGg3MStWLzgwZW42amhoWEV1?=
 =?utf-8?B?VE1YZkRJVEx0YUtVNmtub3FNeml6Sjl2dzNGSGkzcUtNUGNRZjJnYjhDZEZZ?=
 =?utf-8?B?RzBFclpYclBaMllRbHNYQlRFZjFMR2V5MnJaeWFvQUtERUNyMFBJSGYzWVNU?=
 =?utf-8?B?L29xTmIwelRhNDNmMlUzUDR1b29zZUxpOGFXMVZ5bldYRUF0N1JqTjFCNEdU?=
 =?utf-8?B?eVVSSFNUdjMxczdFbWNqKzJldmJIdS9XUlFyWFEwSlgxUWhhbS9waFJiTlRT?=
 =?utf-8?B?OVAwRVc3alJmam03NG1aS2k4aXp5bFlRZGZBUFpJMHR3LzRyMjc5QXdQUmFj?=
 =?utf-8?B?NXVtZWtBd29mZmFZdUVzWTJlSGRHYjBKb0RtMVlzN1ZuekNZUlpMNlJZSVhv?=
 =?utf-8?B?VHNFUm9McjVseVcxaG40S05tbXZBVFdwZnA3dHRXdTVXNjdiRW5TcXV2eHdJ?=
 =?utf-8?B?Sk5nNkExZjU4NVNyRzcxL0xpays4cXVTMS9wN0pyWmh6VHFnT3JwcUhmdnBO?=
 =?utf-8?B?cmlUeXQrR09VUzdLVWRXWFJSUS9mczlMTGIvNkp1aEZpNHJpdTZJZHUvNlpo?=
 =?utf-8?B?NTh3WG43V2pBbmczVzJuYXRNRTU5LzRnTnBtUkc5TUJjK0t3Z3JUYWRvcHBP?=
 =?utf-8?B?WmRlQ3lFYWVaMFlnb0dWS1h4bncwdC96SzY0d0t6a2YzT3JReEdiWmpjOW1D?=
 =?utf-8?B?S0hwSVVzOEFZd1VNUDV0Vi9meEt3N0Q4RjkrWFhjZ2NJejZ0UGI5U2o0aFZE?=
 =?utf-8?B?TjloOUVTTlBRL1FjQzNQeW5Hb0RwNXYvZjhNSStVd2hXbWtCUGtMTWYrZ2Vz?=
 =?utf-8?B?QWkya0QvWHhlSFhWY3YwT3dYVVEwT0lRdVdRaUtJYmdscUZYc093cUJ6aWxq?=
 =?utf-8?B?RU11aGVsMEpSOXRkWnFYZit2MEw2S1doN0daTWc0alZVRU1FUWRmd0xOYUdR?=
 =?utf-8?B?SGUzM0dROW8zeHM1QzMybnpnOGxFVjU3WDdNbGZMV0JpZG8yUmN1LzRrZ0RW?=
 =?utf-8?B?eGh4emNkRGFud0FQOEtKVnVrdlBZSGF6bXFzNjBJR0dZcDNSb01BWldSRUlJ?=
 =?utf-8?B?bitVWExHbUNTK3Fzd1Bkb2Y1SXphaEUvb2NGZHFLa2tNN3FPT09OWHV6Y3Ns?=
 =?utf-8?B?YXUxc3FEdUdOTUZXNGFIRnYySnhESHdVcVVUbWVoMEp2ZjQrdGJUWnVxcW1D?=
 =?utf-8?B?dnVCa0NnbUlLTDBaTzIzSnVFZnF3RmVjZmhQeVd1SzRENzdnSUMzOVBTTEd1?=
 =?utf-8?B?VWY4NUJaTjMyNkJEU3VyWCswYmtYUFNtZDMvclZscGJ6NUZISWJuSjlRVWZV?=
 =?utf-8?B?dThmMm5XU0YxZjd6KzVPbEoyNTRhbEw0WG16aENQN3pldm9RUmZkcVJQMm9Q?=
 =?utf-8?B?L1Q5OTdEL1R4MXphNzVhb215b0t4VmNwckxUYmVudE9yRllpVWhVUnkxRHlE?=
 =?utf-8?B?K1gxeWQ0aVQ2MHl3NGJubElSSnJpWFdyclVoQm1DMHpFZmtQV1BuSExwMTls?=
 =?utf-8?B?bXNGbjNjVkI4Q3NJTDd4eXowdjZJMVp6UnVZbmF1NUI1YW5IWnBuVXBRQmkv?=
 =?utf-8?B?cXNTbTRDRFV0aGZldnJHRnBGRTBobUx6YWtxeHNGTTR6NXdPTytLK1JBNG9Y?=
 =?utf-8?B?b3VJY1NuaCtQQzRUT1hzU2Qra1lxOFRYQzgvRXVaWlRWQ0JLZU5VamdWLzdl?=
 =?utf-8?Q?RQFOIxMV3r5NrGamiTHPTKi1P?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca029a5-4106-46ca-9471-08dcd0e4df0f
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 15:34:19.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNp1d6r0mKNtFO9n4QCwEEyk3FZ6Bdg4kpK7UIFtLlqsX3lO0CsgtgGw4wOHOHlSr8ru5OgnfnhVB1FmQW0WxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6452

On Thu, 05 Sep 2024 14:33:07 +0100
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> Enable rust for linux by implement generate_rust_target.rs
> and select relevant Kconfig options.
>=20
> We don't use builtin target as there is no sutiable baremetal
> target for us that can cover all ISA variants supported by kernel.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/107
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> 	- Add micromips flags
> 	- Sync issues with upstream
> ---
>  Documentation/rust/arch-support.rst                |  1 +
>  .../translations/zh_CN/rust/arch-support.rst       |  1 +
>  arch/mips/Kconfig                                  |  2 +
>  scripts/generate_rust_target.rs                    | 68 ++++++++++++++++=
++++++
>  4 files changed, 72 insertions(+)
>=20
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 750ff371570a..ab6c0ae5a407 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,6 +17,7 @@ Architecture   Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> +``mips``       Maintained        \-
>  ``riscv``      Maintained        ``riscv64`` only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Doc=
umentation/translations/zh_CN/rust/arch-support.rst
> index abd708d48f82..1eaa6c3297ac 100644
> --- a/Documentation/translations/zh_CN/rust/arch-support.rst
> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
> @@ -21,6 +21,7 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  ``arm64``      Maintained        =E5=8F=AA=E6=9C=89=E5=B0=8F=E7=AB=AF=E5=
=BA=8F
>  ``loongarch``  Maintained        \-
> +``mips``       Maintained        \-
>  ``riscv``      Maintained        =E5=8F=AA=E6=9C=89 ``riscv64``
>  ``um``         Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
>  ``x86``        Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 43da6d596e2b..a91f0a4fd8e9 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -90,6 +90,8 @@ config MIPS
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> +	select HAVE_RUST
> +	select HAVE_GENERATE_RUST_TARGET
>  	select HAVE_SPARSE_SYSCALL_NR
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 863720777313..bbdf8a4dd169 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -141,6 +141,13 @@ fn has(&self, option: &str) -> bool {
>          let option =3D "CONFIG_".to_owned() + option;
>          self.0.contains_key(&option)
>      }
> +
> +    /// Returns the value of the option in the configuration.
> +    /// The argument must be passed without the `CONFIG_` prefix.
> +    fn get(&self, option: &str) -> Option<&String> {
> +        let option =3D "CONFIG_".to_owned() + option;
> +        self.0.get(&option)

I know you follow the code style above, but this should be

	let option =3D format!("CONFIG_{option}");

> +    }
>  }
> =20
>  fn main() {
> @@ -203,6 +210,67 @@ fn main() {
>          ts.push("target-pointer-width", "32");
>      } else if cfg.has("LOONGARCH") {
>          panic!("loongarch uses the builtin rustc loongarch64-unknown-non=
e-softfloat target");
> +    } else if cfg.has("MIPS") {
> +        let mut features =3D "+soft-float,+noabicalls".to_string();
> +
> +        if cfg.has("CPU_MICROMIPS") {
> +            features +=3D ",+micromips";
> +        }
> +
> +        if cfg.has("64BIT") {
> +            ts.push("arch", "mips64");
> +            ts.push("abi", "abi64");
> +            cfg.get("TARGET_ISA_REV").map(|isa_rev| {

if let Some(isa_rev) =3D cfg.get("TARGET_ISA_REV") {
   ...
}

> +                let feature =3D match isa_rev.as_str() {
> +                    "1" =3D> ",+mips64",
> +                    "2" =3D> ",+mips64r2",
> +                    "5" =3D> ",+mips64r5",
> +                    "6" =3D> ",+mips64r6",
> +                    _ =3D> ",+mips3",
> +                };
> +                features +=3D feature;
> +            });
> +
> +            ts.push("features", features);
> +            if cfg.has("CPU_BIG_ENDIAN") {
> +                ts.push(
> +                    "data-layout",
> +                    "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128",
> +                );
> +                ts.push("llvm-target", "mips64-unknown-linux-gnuabi64");
> +            } else {
> +                ts.push(
> +                    "data-layout",
> +                    "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128",
> +                );
> +                ts.push("llvm-target", "mips64el-unknown-linux-gnuabi64"=
);
> +            }
> +            ts.push("target-pointer-width", "64");
> +        } else {
> +            ts.push("arch", "mips");
> +            cfg.get("TARGET_ISA_REV").map(|isa_rev| {

ditto

> +                let feature =3D match isa_rev.as_str() {
> +                    "1" =3D> ",+mips32",
> +                    "2" =3D> ",+mips32r2",
> +                    "5" =3D> ",+mips32r5",
> +                    "6" =3D> ",+mips32r6",
> +                    _ =3D> ",+mips2",
> +                };
> +                features +=3D feature;
> +            });
> +
> +            ts.push("features", features);
> +            if cfg.has("CPU_BIG_ENDIAN") {
> +                ts.push("data-layout",
> +                        "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"=
);
> +                ts.push("llvm-target", "mips-unknown-linux-gnu");
> +            } else {
> +                ts.push("data-layout",
> +                        "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"=
);
> +                ts.push("llvm-target", "mipsel-unknown-linux-gnu");
> +            }
> +            ts.push("target-pointer-width", "32");
> +        }
>      } else {
>          panic!("Unsupported architecture");
>      }
>=20

Best,
Gary



Return-Path: <linux-mips+bounces-935-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13F82DB17
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jan 2024 15:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB6FEB207C9
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jan 2024 14:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52EC17586;
	Mon, 15 Jan 2024 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="cFPboNwf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G2HqDgmz"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677821757E
	for <linux-mips@vger.kernel.org>; Mon, 15 Jan 2024 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D6E803200B11;
	Mon, 15 Jan 2024 09:14:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Jan 2024 09:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1705328057;
	 x=1705414457; bh=4/MQH8cFDtD1KPvHP0Fb+2ocHi3F1oU4xlzfSoIxMC0=; b=
	cFPboNwfoGjSlHTHjrgmX5E7GttRlM5cPoCvzNBrjKbJPi5F2C6O5vfJkTkdwa9I
	us+zfy+kdsrgskeUIHpf3pXOQ942DSbax94qGH1A8cjY8ybYGZYT4RxCEfFIF7xP
	6QNXSwMleKmUn8GnOBk6c91xGap6uVc86k3zDAcqt2DOwevDTDV9l/FwlPmGfvSm
	qG5IV83s1Pd7Mv/p4YRiTnTs3Kg3Yzu4wGRRcmk8XknAHPlbm2jP9KHAHI0+RBCx
	3JRHhUCcipHdAKeRka2HZQyjivhjfGZk8qfo0QzREzjXRFEPC+DYlrtqG0bAk5Fz
	gDCX7pEFRLDptqCbij4pyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1705328057; x=
	1705414457; bh=4/MQH8cFDtD1KPvHP0Fb+2ocHi3F1oU4xlzfSoIxMC0=; b=G
	2HqDgmzv7hfi2kY87yf/+1iXxCsu9lPyAC5iaevEg/4Am1uHsvB9nMkmY9FSL44z
	KLwKn/aSfVUhZNgCaNgyEo3RquHhuXXBRcfIxWLeSAaZXH+VvwJXJgxEApRLJwi5
	XuN3YkJwSjyuxhzqS47OL1EY2at7XSccsyba+KfHGZi4VMS61opCi9OKio6PvidS
	Ilc3zDXLEF5BF/4sMzehnDnOVSxWVgJ4dmAqZhTPjF60qOuDwQyqEBtljCslKyO9
	T2v0BwcEl4RySoBI8F+4VDWBz1hVXlHFFjU1GniTQ4+GiAS3RnpOOz5NGP07f9Ph
	OPD4fZYc3o8PJMZyNCF0A==
X-ME-Sender: <xms:uD2lZeJI798u4MyOqlYPZghn8-Bhy9itLIKQFszZkZ6qj2z4Xd3IrQ>
    <xme:uD2lZWIwq8iKjrTDnrXmWqdUcJCD2QDy5JmPIq6YdOWWBxHPuVlnuP4Mbj2KauTye
    NcMDuydbV-p__9H7SE>
X-ME-Received: <xmr:uD2lZev9E8w04RM6_rJNjLJu-UzUKVzl5tMKg3VpOZ9s1x7v6Y2lPADxbHLZ7zReo_tRnoJb277Sx2h39gZW9OYUGEuOzECG0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejuddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepudehjefgtedvkeevvdevieekleekhfevkeevleehieekfedu
    teeuffduhfehtdehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:uD2lZTarK_4vZhkgk5K_mXpS8-UW_Jk01Fq5c5rArIVocUCL4Ln_vA>
    <xmx:uD2lZVYudlqV7ItyjbezqvHxK9IrO5DwiwqbNdGGfeOXpdG3lC7-0Q>
    <xmx:uD2lZfCaIX5q2DL7BMcY94i25DJQciSTDUOeF8itLTd_jFZ40jUiKw>
    <xmx:uT2lZR6XqehK3CPyRAOXX3AvBBF4NWNJi6JmPIIX1yfsxRSNJ15raA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jan 2024 09:14:15 -0500 (EST)
Message-ID: <92cc976f-cd24-48c0-9ac6-b9374fba158a@flygoat.com>
Date: Mon, 15 Jan 2024 14:14:14 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Revert "MIPS: Loongson64: Handle more memory types
 passed from firmware"
Content-Language: en-US
To: Huang Pei <huangpei@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>,
 Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
 <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
 <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
 <7d4fe00c-259d-4e19-90a1-272bc2adcc7e@flygoat.com>
 <20240115012512.y2ujt3xmks3regel@Board-3A3000>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= xsFNBFnp/kwBEADEHKlSYJNLpFE1HPHfvsxjggAIK3ZtHTj5iLuRkEHDPiyyiLtmIgimmD3+
 XN/uu2k1FFbrYiYgMjpGCXeRtdCLqkd+g9V4kYMlgi4MPHLt3XEuHcoKD1Yd2qYPT/OiQeGM
 6bPtGUZlgfOpze1XuqHQ2VMWATL+kLYzk6FUUL715t8J5J9TgZBvSy8zc6gvpp3awsCwjFSv
 X3fiPMTC2dIiiMh4rKQKGboI1c7svgu6blHpy/Q5pXlEVqfLc7tFTGnvUp95jsK639GD8Ht3
 0fSBxHGrTslrT775Aqi+1IsbJKBOmxIuU9eUGBUaZ00beGE09ovxiz2n2JKXKKZklNqhzifb
 6uyVCOKdckR8uGqzRuohxDS7vlDZfFD5Z5OhplFY/9q+2IjCrWMmbHGSWYs9VV52XGM+wiEG
 sM5bup03N2q1kDXUWJ+zNNYowuOJKN9uxF3jBjdXSDi3uJu/ZUL/mBqI58SkHq5NTaHypRoE
 5BxVmgDMCGQe93adKHUNmt4HK28R506S7019+umg1bq5vA/ncmh/J2k8MFGPXqO8t1xVI2O5
 qrRheRKu1oST46ZJ7vKET1UwgcXTZ1iwqFlA26/iKxXoL7R7/AqWrapokEsUzRblGcutGZ/b
 4lJVOxxAWaRcajpWvwqscI2mUF++O7DxYbhOJ/EFY2rv0i6+/QARAQABzSVKaWF4dW4gWWFu
 ZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+wsGRBBMBCAA7AhsjAh4BAheABQsJCAcCBhUK
 CQgLAgQWAgMBFiEEmAN5vv6/v0d+oE75wRGUkHP8D2cFAmKcjj8CGQEACgkQwRGUkHP8D2fx
 LxAAuNjknjfMBXIwEDpY+L2KMMU4V5rvTBATQ0dHZZzTlmTJuEduj/YdlVo0uTClRr9qkfEr
 Nfdr/YIS6BN6Am1x6nF2PAqHu/MkTNNFSAFiABh35hcm032jhrZVqLgAPLeydwQguIR8KXQB
 pP6S/jL3c7mUvVkoYy2g5PE1eH1MPeBwkg/r/ib9qNJSTuJH3SXnfZ4zoynvf3ipqnHsn2Sa
 90Ta0Bux6ZgXIVlTL+LRDU88LISTpjBITyzn5F6fNEArxNDQFm4yrbPNbpWJXml50AWqsywp
 q9jRpu9Ly4qX2szkruJ/EnnAuS/FbEd4Agx2KZFb6LxxGAr4useXn6vab9p1bwRVBzfiXzqR
 WeTRAqwmJtdvzyo3tpkLmNC/jC3UsjqgfyBtiDSQzq0pSu7baOjvCGiRgeDCRSWq/T3HGZug
 02QAi0Wwt/k5DX7jJS4Z5AAkfimXG3gq2nhiA6R995bYRyO8nIa+jmkMlYRFkwWdead3i/a0
 zrtUyfZnIyWxUOsqHrfsN45rF2b0wHGpnFUfnR3Paa4my1uuwfp4BI6ZDVSVjz0oFBJ5y39A
 DCvFSpJkiJM/q71Erhyqn6c1weRnMok3hmG0rZ8RCSh5t7HllmyUUWe4OT97d5dhI7K/rnhc
 ze8vkrTNT6/fOvyPFqpSgYRDXGz2qboX/P6MG3zOOARlnqgjEgorBgEEAZdVAQUBAQdAUBqi
 bYcf0EGVya3wlwRABMwYsMimlsLEzvE4cKwoZzEDAQgHwsF2BBgBCAAgFiEEmAN5vv6/v0d+
 oE75wRGUkHP8D2cFAmWeqCMCGwwACgkQwRGUkHP8D2dXlw/8CGKNXDloh1d7v/jDgcPPmlXd
 lQ4hssICgi6D+9aj3qYChIyuaNncRsUEOYvTmZoCHgQ6ymUUUBDuuog1KpuP3Ap8Pa3r5Tr6
 TXtOl6Zi23ZWsrmthuYtJ8Yn5brxs6KQ5k4vCTkbF8ukue4Xl4O0RVlaIgJihJHZTfd9rUZy
 QugM8X98iLuUqYHCq2bAXHOq9h+mTLrhdy09dUalFyhOVejWMftULGfoXnRVz6OaHSBjTz5P
 HwZDAFChOUUR6vh31Lac2exTqtY/g+TjiUbXUPDEzN4mENACF/Aw+783v5CSEkSNYNxrCdt8
 5+MRdhcj7y1wGfnSsKubHTOkBQJSanNr0cZZlPsJK0gxB2YTG6Nin13oX8mV7sAa3vBqqwfj
 ZtjNA+Up9IJY4Iz5upykUDAtCcvm82UnJoe5bMuoiyVccuqd5K/058AAxWv8fIvB4bSgmGMM
 aAN9l7GLyi4NhsKCCcAGSc2YAsxFrH6whVqY6JIF+08n1kur5ULrEKHpTTeffwajCgZPWpFc
 7Mg2PDpoOwdpKLKlmIpyDexGVH0Lj/ycBL8ujDYZ2tA9HhEaO4dW6zsQyt1v6mZffpWK+ZXb
 Cs8oFeACbrtNFF0nhNI6LUPH3oaVOkUoRQUYDuX6mIc4VTwMA8EoZlueKEHfZIKrRf2QYbOZ
 HVO98ZmbMeg=
In-Reply-To: <20240115012512.y2ujt3xmks3regel@Board-3A3000>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/1/15 01:25, Huang Pei 写道:
> On Sun, Jan 14, 2024 at 11:58:25AM +0000, Jiaxun Yang wrote:
>>
>> 在 2024/1/14 08:53, Huang Pei 写道:
>>> On Sat, Jan 13, 2024 at 11:59:11AM +0000, Jiaxun Yang wrote:
>> [...]
>>> In my test system with kunlun firmware they are actually covered by SYSRAM
>>> type.
>>> IMO, better to add those memory to memblock as well in your case.
>>>
>>> My test machine is PMON-based 3B1500, the SMBIOS_TABLE located in
>>> 0xfffe000-0xfffe7ff, which is not included in SYSTEM_RAM_LOW(0x200000-
>>> 0xeffffff), I think we need a check like,
>>> ----------------------------------------------------------------------
>>> 	if(memblock_is_region_memory(addr, size))
>>> 		memblock_reserve(addr, size);
>>> ----------------------------------------------------------------------
>>> to support both cases;
>> Then we are running into ordering issue. memblock_add of SYSRAM may later
>> then reservation.
>> What about unconditionally add those ranges to memblock? As it's certain
>> that those regions will
>> be RAM.
>>
> I think we can do szmem twice, one for memblock.memory, the other for
> memblock_reserve.
IMO this is a little bit insane.
LoongArch made a workaround to set all reserved memory to node zero [1].

[1]: 
https://lore.kernel.org/all/20230911092810.3108092-1-chenhuacai@loongson.cn/

Thanks

-- 
---
Jiaxun Yang



Return-Path: <linux-mips+bounces-15398-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id atGtH6cmRWp/7woAu9opvQ
	(envelope-from <linux-mips+bounces-15398-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 16:39:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDE6EEDC7
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 16:39:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N1D8ezUR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PoW9airN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15398-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15398-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E77C31478C7
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 14:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37043344DA2;
	Wed,  1 Jul 2026 14:29:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F37344D83
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 14:29:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916185; cv=none; b=foew9Itjx4KiYe7tFNFy6F+ZWEgZuNils5eQUfDG9XdaFQw3BYUJqyDa7UbrQPuE4u410hcjwGwSRemHr2eNEvu9Mwh+M26DXG02rYun182Ct0dJPYyd4fe/LFi8Xu0+6NvC7hbXyqCQdbNCjacNKgDsgJIemBWd6B0BqE7Hfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916185; c=relaxed/simple;
	bh=n1qejj04sNHaMIzjnmlkuI2T1vR12yhFFuqL+VESCNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yx8/3wgDsfZ8go93VU5888pNpnFPSYBizo+8k/9gio9Hfj2DEg1qHYEqSthLqHvZsrpoGQ0Tr8cYozAxLEey6sRNAS6rnAEby9Q7TFgFs7fqEIlM9gwcXIykFLVMyQ8xuIwzteDR1UMkK1EAnv1fMWkDSqM/V6XattpROWSSlbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1D8ezUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoW9airN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A98Wd756317
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 14:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=; b=N1D8ezURnnupNr6l
	J0GloK45XqK1CmSRZoUQhda/5vuDhG7a4QtxGn3RT+pY7Wc+XNTTVun8q0L56m2D
	QlNqi9vJtY5dcMs1MS43oYv+ydYkKfNPU4UnVi/bkILMeNsIvl3oeIV6ZdHPRH2N
	IbKFSe6diTJa5j6uxetuB7TkUrWHtTgPLk4/onpdifQKQrdn5ZsMliFt2HyBdedH
	ZBU7yWwFWN/GNpJ3GYCt7F0353zfqCW22CoDEZvyfVX6cGVxqBwMBcEgeTH3WXmC
	rCjNNq+pnRgkAIFydePXnMjF7zVHn+AA1Dnhz0NR8lenRA5WdJapk9eaauQ+q41u
	12yweA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqs4ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 14:29:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so78684885a.1
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782916181; x=1783520981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=;
        b=PoW9airNKuK4iYm/TUgVzJ/hOfbglmmXMjQPj1SHfiel0W0fdjW9qD95k/pVAdq7XJ
         EweiRZ1i4G/ttSka6mDMQPq+rRaQIbWN3Z3Qe8r+AAEmDw1md7HkaVXapHjrKQ3V6vGf
         OMkZ0YhnUjdv9EWK2k1C5A5hg2o6FNoCIRGnqQJ0FztLlFSyTr0Uq/OJJYIA/zRuW3wc
         UTtdWV/A0dNXM+g+KqDAlvWUJnBN3FSnI0ZFPhgd83SO8PlNJiyE+TxLHr2KrWW31MhF
         Itj8TAvd9ObbBbtCY+MPSNKS0rOgptFgxU2YDLgs+a7yzCafeZC3Hp+DgZF2287MXlOV
         DpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916181; x=1783520981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkSOof5emTsreQ5QRNYQrP4Tkvxm+w+63WVvb/pRaU0=;
        b=kKW78LBjI8dSiBSNyvin8/J/8iFOV/Jvlj/QE99WQelQm8RlwydFRaiEQgGt+pOBGp
         r2CJBrdCu6n2ps/AWigKQA08x7WHio6593MRyVPnOkRvWIgyN+JGab4RyRWORrhBuErQ
         +1s+hjtgzyC6WJRxy3tzF7iQfgoiMKciHeaSZmuCeYZvJXk2GaYLKC8tku5Fae6Wcpty
         ElGG+rju6nAXMxSAakdw3dLNlRtY78y1cdnwzCl7oYPUDYvBs5QHnjOISFqqlJYVLwQ8
         aFReHRo9WL1Dsu0m+V9McmQXVc+q1sUrachLsXD/eAIqK7Q2lZ6gNHoLcQealR4f5XaB
         d3Og==
X-Gm-Message-State: AOJu0Yw4mp+aAMD9Mrgy1BH6XI6pzl6ZR2h1OIaoTpg5Q5af4zUQXXVp
	eHkan6K7LCl5IHM2UXjrzdf6j5uHOrqm+U0UMBrdzme0o+1u/Wje4MQPwoM2sjuPOenm2BeYiaz
	2j+xFdvA+qUJ7D/ngAWKcr9It5c1mNR9nn1RDP66WW1ngPTFSHdvI9H38D6fBnIhM
X-Gm-Gg: AfdE7cno+jHiJdr6akBVW8rbyopAK5+DAE9VBfNO7MXAH7LiBOuwnWZEt9tQN7EVkbW
	QG9MnmAxBUWMHB/hHj3U/YFSg5/uglRiCD2S46hubkUJ1LTgBScVMTixsQLxrrf1ZBvl0XYkkPa
	pQlaPuzfgN1LibWJwZqdWul3wz2WvrjA/EzjaK2EAekdxGKM1M46A/p8feivRZVd7G/fERl4/Ge
	aSzHs1xl0SFI21TVHB9aXK+A0F7aT8/pXuN10MMR1hDh1AAHSOGPVLt6J8aTN6+92Eo0j4G2yTC
	mjbaui9ndALjyu0bs22eMYouFqKSLF85nx4wrFhx31eUwUWxwAKN1K9hxb+Q23hItz3MWqaeQGN
	/BOc77DMlMJEftKcfM02oVniQCut4JZY=
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr251421785a.49.1782916180656;
        Wed, 01 Jul 2026 07:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:915:efa6:d70a with SMTP id af79cd13be357-92e784d06e2mr251418385a.49.1782916180241;
        Wed, 01 Jul 2026 07:29:40 -0700 (PDT)
Received: from [192.168.69.212] ([88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm264534f8f.2.2026.07.01.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:29:39 -0700 (PDT)
Message-ID: <2df27e6d-082f-4334-8bce-fb23ef0dd7f3@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] MIPS: TXX9: Use GPIO lookup table for iocled LEDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <cover.1782900491.git.geert@linux-m68k.org>
 <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: heGOpV49nFEC1UG-HbyV_gbfa9-nzO3u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfXzOZqHgCNsLuX
 5G1fRTdAdE1QTlL3h2X8/v7br5A/pnDDsr0Q2yhcFQ30SbAYr7uLDRLLH4/xvDWi7BkKEfmFDXk
 5WmheSuKFkgmRwpNZM4J0+WWx/5z6wc=
X-Proofpoint-ORIG-GUID: heGOpV49nFEC1UG-HbyV_gbfa9-nzO3u
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a452455 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX/QnKFOskXhqE
 /J0GjiQVmd/GGh6F88TT+R2yJ3yVmGlvnkXzTYNSO4k7g0qSVFTwxkqTMO5DeBb2fkdwWECvN7f
 3PqcNqFlAJB83dcNUBn8GkM1OegPJ8XDojsJXcSdRtHjnswMPk6lM+nEezFzV3BDVwJ9sRWKwjw
 yTLPSht7rbxESv8YtK7yRk5xkRko2BpbeantZ5QrSKzEDXidpn+4aRTZtxMGRDEHyc3785nzHcx
 kOCjCbAmNDFf2VOn79/hbzljTdn4L9w1IKEOzdnDUw0nnz+DQHE7r4OqoX9F63m/kpE3q/JIveR
 rHDp74Y0jX6a5CxANg9kxWgGscvjJv7HPkzeyqLx3KCOcLBmsU9fl03CUrTmsWc27VEvVdd4y2t
 a6C3We4ybOD3zqhjZXtYgqx9NNpyQEPazjsTnA7h41MTnIBiYi8m4m/OJzV67qbVOwNUB+ZDeHA
 gfybNpjmpIUpOnyXclA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15398-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22DDE6EEDC7

On 1/7/26 12:11, Geert Uytterhoeven wrote:
> Convert iocled LED description from legacy GPIO numbers to GPIO
> descriptors using a GPIO lookup table.
> 
> For now, just ignore the "lowactive" parameter, and force
> GPIO_ACTIVE_LOW, as that is what the sole caller wants.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> v2:
>    - Add Reviewed-by.
> ---
>   arch/mips/txx9/generic/setup.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


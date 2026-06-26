Return-Path: <linux-mips+bounces-15226-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2HHGH/d3PmqmGgkAu9opvQ
	(envelope-from <linux-mips+bounces-15226-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:00:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC86CD3FB
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:00:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pDTB8AiI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DFxmPFDb;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15226-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15226-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8C23303D700
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 12:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36A03F54C4;
	Fri, 26 Jun 2026 12:58:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE593F4DCF
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478711; cv=none; b=UXc3zRcAHoiTEP/2zVpxqJi9Sx1hxFku/U+XKHejgIoFPu935exWL9hoPq6+AFkar7EusK3JT8Opfqrw2Jbc5eZ2ajhZIub76Nz+F59KbpputhXYNDLel2nucCnTLFifU0lp+mNtI8da2M2EFpVuML8tQ4reYQanLh/4o/wyJ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478711; c=relaxed/simple;
	bh=+OlUQba1mQGfipqI8r6dVYStKCGzSKIj714y/2Hbqss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgWi2NHymTt411b46O/lizaIYyODNIs48XH6eTzvVKIH8GDv5USSFVPpwD2JD+n/7h4G3Tz6y0DJtOLs93hMDEjblJ+7BtKI0wgiV5cDO/yPlbySL6hyVO7ZNQ6jEcfpjWSnP0dGEVlaEZDrjdXHXgwmgJz1NKVNa8VzZHGvb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDTB8AiI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFxmPFDb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAclqb1189999
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKb+5wxCi2e5dA2tiEHznLDPPtOeSzg6646f6e4d+i4=; b=pDTB8AiIR1wVF32w
	tdGABFapnXjJIs7IYx+UfM9fHz800MG0h9yIwv0u4nyO4NPLNt/VnisY7ffeIYM1
	XlwB5Q+YWa2mHB9W81BT2Mpu6AX4R/hSwekelb+DLmlQtY7hI2LT4uihJcR/DW5D
	XzTMCRW9Y2ct2c1iMAlXH88staI+aYiXYexw3Ti+3VHQI+5zrg2iC3KCRaP9Lx9e
	mJpr1sqVpuCR4tLunxjQDH9yARtufqKgyHIzY7j5WQF9p/XpMFd8aHPYt+557xMk
	EjfEV5MUPtWgqeQMSZ5Sc8VlXdYqIRmKg8dO6/ZyqElQnJVpvWBZ9ecltDvwu2We
	H/fIaQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1askukra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd79bf6152so1105402e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478709; x=1783083509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKb+5wxCi2e5dA2tiEHznLDPPtOeSzg6646f6e4d+i4=;
        b=DFxmPFDbO3apcabyAji7aqfvbbsy5ennL1U5xevCLPbDnZqBFWsckcSn6YP+Hw1pXU
         cAZc5Tf24vY26WVZ+JdP2mbmIOUIgXyhEw51ptU6jMCcofjPsMQ4sYEXfhqlbxO6g6Oe
         iqnkzOGNQYYqghzKNw6bv2fDhbfYlYmjuRg7bG9OYluR3zbkqkUdfxDaenFHXtx6l4Mp
         BQdoyZF94pPapujNQNa8Y4UDnbDeXUjArlosW4RTW73Ik+A5wm7dwOgRlobJFAKOxxez
         zN1AuZwqKyFdhfrgEmhxxGUDs919ZgBbLmGbJCGbXtGqMoeh+EzJYDJtxnPPGowHqWZX
         48JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478709; x=1783083509;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKb+5wxCi2e5dA2tiEHznLDPPtOeSzg6646f6e4d+i4=;
        b=LOt/R3UjsNYAxSM11M5+Cjz61IK+TiFmaOhr+eNN1d0dWV7qzfPBD3BWH9Gnz+ZzTR
         +zSlHnwlan58Ag4RJ6ktQsA8fQSywWdvTSUEjysllBrhhB5N2lNV7NK4E4jp1JizXigI
         i/YAdlOffSkv6SXLVYSZwgfsqPdC+7IfX6FkugqkSGdRli73GFov0Nu8G6Dj9l4QQlQ8
         dTP0YzXY6DULiMmCicqMzR26JDxRKkdIcDoQiS5EL/VQEcL8MrySrtFD7QXWm2XIPhpL
         dfqNbQupbb+2hpq8WaAafOjSDJWeVkXMoAmv/o7amwjXbafZUxkeX4t3FNrnUW9A4PU7
         bi5A==
X-Gm-Message-State: AOJu0YyXLtislCv7XoDzJ5zVJgwA3ml4GX1K3+ln3/eQN8VzXiuQE2Bt
	B10SrVm8+78dKl+WJUy3OvlH3PI4CHBhchecOI+Xxjub7wGfpDsU+8nPSKhO6yGQixWVaJJYE1Z
	KIpmfF6YP5lwCt9BW5ZhIKbUTl2m41KQY6xYIBUsRNikWOOd6F23UeAJqesh46Oxqy4e35Vow
X-Gm-Gg: AfdE7cnNxPGyTVE9isl39dpM7EL7LbiLMYv/SLmr8jgSOyJyDx2Oq5QJtWtHqNb8VPE
	YTEqrEzxwUej6FfRK87u1eIhI/d/Q7Oa/1vSnXkePeqCxW88PSv8waM3N81pndLbne5UoHBcUQL
	PwMuwwoj2/rJP+jpsVgkvgMmjWHQW0/mr0jtxAegNKIcmytbMMMdrEtob7AixQ/+40GWG/0GUDZ
	jjD9g8xK7PCngLuzG9V9/SuwAC2hMOxedHy5YGoUp+EBfZ0lB9awHom7XfxIMk6DTUKFTct0YyF
	rKyuh5RjwfypupdATrTKK4WKQRwq+BmFbmyy7paGFxc2QCenCt888R+wARve9gmt1RHyzFbGWEl
	AvLq189abh/ijds19snJdgycbddRxkLn0CJ8GUtg3uMzquu4ExZXR6oKqknwBdA==
X-Received: by 2002:a05:6122:8d4:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5bd69d027a0mr3344254e0c.8.1782478708931;
        Fri, 26 Jun 2026 05:58:28 -0700 (PDT)
X-Received: by 2002:a05:6122:8d4:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5bd69d027a0mr3344242e0c.8.1782478708459;
        Fri, 26 Jun 2026 05:58:28 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6980afa5051sm1538044a12.9.2026.06.26.05.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:58:26 -0700 (PDT)
Message-ID: <af2fb9e0-ccd5-48ef-94ca-4defb0b63d39@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] MIPS: TXX9: Remove tx4938_spi_init() and
 txx9_spi_init()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <c9a39ce801ab0b6c07717816272255a166790274.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <c9a39ce801ab0b6c07717816272255a166790274.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX+D2MeQeIZmr2
 chOX+QAuPH98eUdX9MFNnDg/uIFyvkVwwToUStEP7cY9DtAP8aCT20oR0/zxHgIwDyN3l4dcfHJ
 tavkM9azfMd4nbUo57MpJKq2yBxS5cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX0O3tIabCDPx1
 8KkojRG079koYHSbaPcFcWc/lnAu4tiwy8Qp5Rd48kUWNg60Zrfcihi5/KT1RkPmcRV5Y1jjNZ7
 evIGsOfCv3qNW7SqHPNNVJI5ugdQEnJ2MZ+PoGDgcLG+uylHTs/y3cD6x3fvIZOMdzANHndjtIG
 p60s6JKwdhFJuhePnDZilb/wmxo5ylJHnCIF7rtRgFctCmw2P9Cieny2ueYrIrPxmPK/qrrFasy
 7Zk2AFtdf5he3iC0hDrlqSFXj6+lXDMfOBEyRFyINVin8Pv5OkSIVbzpnfENCKSbQrCu2WyVvi6
 i9p2sGaONnTwCsh5O+8+E2XWNmDBA5WYhKkWWUkS48HRuoLMuWu8+7TzVCkvw3seA31G/XM1gKe
 9EgVMqlRJwzOGPCuMG42BTfJSCkTHCjHyfmrYH/ICg4+PRoIRP03pJ/w5by1lsxCayRWjDBdnU+
 YDHOXrmsEbmLHws4V7g==
X-Proofpoint-GUID: Hm-KcWhXDYCernLzk7A7hdb7qsGXn3EU
X-Proofpoint-ORIG-GUID: Hm-KcWhXDYCernLzk7A7hdb7qsGXn3EU
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e7775 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260106
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
	TAGGED_FROM(0.00)[bounces-15226-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBAC86CD3FB

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The last user of tx4938_spi_init() was removed in commit
> 21d638ef9483d8cf ("MIPS: TXX9: Remove rbtx4938 board support").
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/include/asm/txx9/generic.h  |  1 -
>   arch/mips/include/asm/txx9/tx4938.h   |  1 -
>   arch/mips/txx9/generic/setup.c        | 17 -----------------
>   arch/mips/txx9/generic/setup_tx4938.c |  6 ------
>   4 files changed, 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


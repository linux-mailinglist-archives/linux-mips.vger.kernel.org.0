Return-Path: <linux-mips+bounces-15121-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/RdIL2OMmpQ2AUAu9opvQ
	(envelope-from <linux-mips+bounces-15121-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:10:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D44CD6998C7
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:10:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EH+SM2L7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=alHDbJZR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15121-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15121-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532DD3076B39
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 12:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4193217F27;
	Wed, 17 Jun 2026 12:01:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F1231A21
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697680; cv=none; b=fsrH36ridf3aKz8x2OJ+zdaMAALq/rf0tWylJq5XJ3U+09HRmEnHkhaLYsEeeaRTm7Hq6l13EzrTfPO/zT7PafCC3jyEUg2gXyBccj4JERQ48eofaiO9DptT3MIcRiAobHfjxuEyHlGyYxF4SHN+OhoVsR0niLP4U8kAL2nJBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697680; c=relaxed/simple;
	bh=V8Rd5Kazt6RdByTHvi7A5NlbN3QZmnMAaXNMTi48UsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBSlhAlJ2JZFnQBryYOBhx8xiTjkUj+zgXVXmhRifewDPrFGh2c38MgGO9MYZvGU3rxsLaSaa9ihrPltcWut13Cj1StXpwQMp10NQX6OEYb4+few+s83W8B9hicJmq0refOlG7gGWUPSuAkjI1WrSwyQNve60BQ3TXhM04TkahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH+SM2L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alHDbJZR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UOfc1703203
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWFTmDf2Lo/JzFBvBuJ3jnJkAJN1DvKDic5JBbNRhM0=; b=EH+SM2L75T+96RT+
	y0NQDXIs79wQiFOhqnzBkBH+Nx8QNbD+PmpEx8agPEq8WFm70yh9kJnUg4Tn61zK
	nYS6xKdHKbeJECIOKm8/ccuSCPujrmCsGqtDEBVf5NVmworWjuWuOgdILCvo7d1t
	GR7uh930JJz4DbSJPWluarzhqplAYjFgWcRMBRnj6t9zK2m+9KRFM6PV8qVNCvrm
	Z0BETuOq/VsVdJuDPRGelW5SujHolHZaXitUMhNK/+eauwaebHmYBDhA1OWuF/aM
	JGCcI5o0MrOvsXrZer+H6QquISpDDIoo88M/hmHDjdrTP1ddVWAF7OICGn8CJJoi
	pLgFBQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2w84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:18 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6eeff3b75so7395736a34.0
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781697678; x=1782302478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWFTmDf2Lo/JzFBvBuJ3jnJkAJN1DvKDic5JBbNRhM0=;
        b=alHDbJZRUDfGbWuBWGFkxh0gTH6QG82wg78uUTZ70RXKoV0QexuSR/QFohsE11ulB/
         9Axmc0Bw9YuOlLGOe4Zx/kXzRYpmk9buWyNe2FnLnsgG3HjOJ/lTdMhzabiicZnhDHBd
         lA+jxDdSwNmFm5c7wkQf98UJVuq8n8PM4wgGjloVcv0o0lqFROIYLrPf/efqzkzn8m11
         0xdCAuRZV1+AGj1NENtLVy04oUH0KjpDZhZywVvm3wUg8RdoZ8NmG/5HJbb3XboBKrd+
         +dMYpRv3y9fjB1Knsf/oDrbx0Tf5VluPxmsycCKNyQGi66usTblTsbBknvrcqgQeoLUT
         cgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697678; x=1782302478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWFTmDf2Lo/JzFBvBuJ3jnJkAJN1DvKDic5JBbNRhM0=;
        b=PreU3YwASxPyf0KWi2D9Ll4V+v41tdbTKva42czZwWeZX7PtFIkc6gtyXNXpdGyv11
         wXfYBn/DyTWZxxeSNnkCevK0GDnos5rvt6tGrkqNLko2n+SVFioURKC5FUEFIrhCN1JC
         E89Ili62AqoZqlknVLjg0XmjdQU3g5NGm64KQLtxtcBa7bBwGu6ctHG4uzlbJlLwdwWt
         A8TzBB0kyyuAkJUVD8CcwXRt7yufLOUw3o7sbRADy4I47PrRSzoM29h/eR3S0TtIZYRq
         wJHEJmjJwuxb/WdeSrAHw2HZdlVzDzZEln+i5AR3L70p+ZIhLjCaLCVZAuLcy8ypjrWI
         wGwA==
X-Forwarded-Encrypted: i=1; AFNElJ8UN2j8OjFjAdVUxOxwTNoXFDoo3VDAT6/80MsPWZi/TlzXFnh9SeWAOXWH/wIzsTdF41TAmg31ibaF@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCgjaA55In1Z+nKPLVT+OYi3P9vwsR4ZQpFqeI5Jpkx+lETda
	uFPbpPXkOdPSXYucdsjrfN+anbofGoxM6pripU4GyceBQFjclylJGxwUE4zCEVlfF74DMfXhqqY
	CHa58HRohAeaK+O58mNGIQcxiSINqt3HH619klmsl7vTQl1PQgBPtTTwJjr8kVNmscBph8juj
X-Gm-Gg: Acq92OEmm0JslptfEWm8kqB+5yuRREHAUa8juMloh8m9hUWkcAFdblAL5CXp5QKRDcn
	Q24KMJ4GJG9SLEjvGibGqg7NpjyQBpSOcDFwJvF/ee8/lVP5VtIv68tIL0ylSC8NVdYfmi9CmQ2
	9AX1R0BQnGin+1LNkPNpTUVl3f501kEMwHPw0IStW2c+RyozpK+zWdvB61EWrNmsr9kZkw6Zdff
	YN9BtxFzJK6UZ4FfToKDqSD+DncEYTO2TFyD2Kp9shmud2r/c9uQzNluArJv2kekFpA2xnLOtGb
	JPfg50ZT2fNZT7L89ZENGfBFjrm8CUJVqyTPOmtoyLIBAfGFJDO0w9GS0Tiev6vQ8BnaSavXCst
	/8umlpFf9ZVx9XB28R3WJ8ZRmqTso3JWNdgaKdPXcShjBZOuzthTFd/e8ohHzmQ==
X-Received: by 2002:a05:6830:d11:b0:7e7:c1d:bf5b with SMTP id 46e09a7af769-7e90c99b2a8mr2639158a34.24.1781697677782;
        Wed, 17 Jun 2026 05:01:17 -0700 (PDT)
X-Received: by 2002:a05:6830:d11:b0:7e7:c1d:bf5b with SMTP id 46e09a7af769-7e90c99b2a8mr2639081a34.24.1781697677143;
        Wed, 17 Jun 2026 05:01:17 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm48890784f8f.14.2026.06.17.05.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:01:16 -0700 (PDT)
Message-ID: <d6fdd40f-6696-44bd-9df4-dbd65f8dc84e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:01:15 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] serial: sb1250-duart: Switch to spinlock
 protection for shared resource
Content-Language: en-US
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: Elena Reshetova <elena.reshetova@intel.com>,
        David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>,
        Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605241630370.1450@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2605241630370.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aARX3fuJPnS8K5plRkD3tY1tRK3wSGIm
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a328c8e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=EbunRdXsnukT5RqbSTkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-ORIG-GUID: aARX3fuJPnS8K5plRkD3tY1tRK3wSGIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfXwW8I1+Ayru/c
 ewbMwkolURo/hpDNpqFCnqK41iOBzu/wmu+EaZHGX/P9AA37ANAlcL8IKwJ5czUZco+tm83ftQd
 hVt6iJsTVB6def5FHisICKPZDUSwJEcFwPjbtHdwlykZP+h920x2SZ8OKcnWc1eD1V3DiUyCUqq
 KoP1RjuPkXxbIZd/IjAG5gO2vzWv/j/kGvOvWnuDG7NBq6k5qbAdDub8SJLrFpw4IXAqVdj3v/M
 3x63yGwxuOhgEqzve4o6kbcETrVxCZEJ0UPjyDO5Qub3/RblGDoyeHBs4v7gboQ6hKm6yQWqt/j
 +yilbAN80FyyyRCunz4A98cXwyaDVvJC+VLajSia7i3NbMO9794QQOBqYV+7jSvqkYOTAd9Wsb8
 N/YRijvTQNuF5JVICNhEqwgdpqDgrkuHbDPSOC/CDs7ADllR5EiqaA+kqUJJilHIaUuCszNf0kL
 9hQowAb3aLPmN3xVTLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfX0W/MDlxIE4Ch
 +2Wgov+1lB2/75sriuGvU7mXiBjZGsTKBK3mRrcDIuUS8/2ChOZM/NPm1e8uszSMhbkCAAEPx3/
 opyUJwVwbH/gPspq8hvx2MzWocvkLd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15121-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,orcam.me.uk:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D44CD6998C7

On 25/5/26 01:12, Maciej W. Rozycki wrote:
> The control register block is shared between DUART channels and so its
> resource has to be requested by the first channel claimed and released
> by the last one dropped.
> 
> It is currently handled with an atomic counter, which however does not
> protect against a situation where request_mem_region() has failed, but
> another CPU has seen the map guard nonzero and refrained from calling
> this function for another channel where it should have (and likely also
> fail).  This parallel execution scenario can in principle be arranged
> via the TIOCSSERIAL ioctl.
> 
> Switch to using an ordinary counter then and spinlock protection for the
> counter updates along with the corresponding resource request/release
> calls, so that the case described above is covered.
> 
> Fixes: b45d52797432 ("sb1250-duart.c: SB1250 DUART serial support")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> New change in v2.
> ---
>   drivers/tty/serial/sb1250-duart.c |   28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


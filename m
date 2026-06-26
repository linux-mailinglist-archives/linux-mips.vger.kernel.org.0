Return-Path: <linux-mips+bounces-15229-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sdu6L4V4PmreGgkAu9opvQ
	(envelope-from <linux-mips+bounces-15229-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:03:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3266CD470
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:03:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kJFg+RMA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QWQvdoXM;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15229-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15229-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE8DB30893C0
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895DD3F58DC;
	Fri, 26 Jun 2026 13:00:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C43F6619
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 13:00:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478809; cv=none; b=Z/9IG7NGKT43RlOH8L7O9zazjdruzxf4xZ0sHy6EeXLkaW86Gr720HrBA73HQ1AR97gQ4PEp7U9JIFGrritrsMAdEDTA1yo6rWyvFAlmcBwSvhDVHnLUV/vgwBGPm38aBrPCsaH3e+kBFj/ZUSF9Y2nuNaOcAo0z3OTq3p7+qR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478809; c=relaxed/simple;
	bh=1/fsRUW3veDQRUxlOh6pic25VjSG653kNEIzC8v5blw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAxrAFeJ4i2WGXrmYDJ9kQST+oNT8TzcyBFPGZh4QKWTBbcDN9Vwy907F0qBtCCAMBKc0QE4BSkc9y6DLuKYYgTOoZzOT0E8Nw+qgqtr1N7aRgRVljV13c8jL9USwI+52xQ+qYjaUusHpiTQwqTcHqKhjVjFpRnkPXFEcQZ9xxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJFg+RMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWQvdoXM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAclGY1190024
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 13:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=; b=kJFg+RMAYKBpOsj1
	gOud6KCjxgLH9bEpDtIQrXVKjZ42EfxQOmFpFaEAMdMU27UM3cQxPMCDZFUvPCnn
	q+FqJuetYi0ZJIlA0kgOYNX0eCwIyNwc7m5Xj/APBSGXaKCM/Mofvf0VWHmC5GYs
	ko4ufyHzfSLr6I6iCZ17zcqUojaJoZ+nwfiuSKnxoRwZo8XLSbOVhVnt5REbXsSP
	M7unU1mW0rlINKgeZuzPiFDIcdjM+3Y/hqdXzfMxwF+RSsmdDpJwKLMHIGuBO0kq
	GfhBwlyDtWbTSfr1zoT1To7rjrFUfpe9bnRI7383kp3LHwzw2TIgcFEde62SWV2y
	Ulu9Hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1askukxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 13:00:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91598af506cso89484885a.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478802; x=1783083602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=;
        b=QWQvdoXMtDA9DzgRERsGsz3epWgbEORrb1xP8JYu7siQ+KnvkvgfK6W8JcTgG2uKlv
         UkzEqwlCVqGiuN3YF25Lpr9cEM3SuvOElzgOPLZuU/cl1G57woYc5bNAp2neS/bTHe7d
         0FL5K86RSq2MJjQxacCyeFGD7yGXDVCKpToGUGyZbmR9Twh4U0yDfjqiYZL0pPkwD+nF
         e+g36Cj5hwqmLOKbZbcYsSBdzlWIA2qkwd2sxbI7z9jdZw4j7ymxbSPKn3dQEStgt/63
         /h3GPcCgkscIQIyXU36TlHWlyB+0Oo9TXV3Bxgt1SESW2CL1NvqfOVfVMkaEGIegmeIL
         QGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478802; x=1783083602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvugCSs7PolA9ovKfI3YOHhYvI9+AEPUIaA6WLCnTzE=;
        b=e31aL2e6Te/8qf7uzcYmKv6EoqJLBU2KBwamxUVoH2Syh74ttP3hRr5sIME2UouTQt
         +ZXWquGP+F3klzb0/b6vEyj0CSa4aK4EeuG1de3WhnaybAXW8azETp225A9HzwEky/e3
         RqPxnTPVYo1PrdAgEv2g8UHl+Y0uwCnWqJaAgro90PRWMsZE92Rdbz+nfDH4s6ovUsTr
         w+OE8LZpQ4wo1+hZd7wC0XIMMNDLa9PWteiypqeMw3ZroQTAjkokS9xPSXbDnMOhQUQJ
         Xwzi3WMu3o/R/Njm8V9P5DChz2vpLhGZfZkP3sNPlYbjihm5M5Nx8NYjHpMAoh+Vceye
         wKrA==
X-Gm-Message-State: AOJu0YyQ9h6miFPGwDp8O3FdeQn+66yAe90C5gnoMArVee4ytbj2uEzp
	VkeQenxa4NmjrNwJYoNANn7R9VEbVaaJxgN/4kBrRCSrnlo8T/zBROXzpmp3vWogB79xcKl5WGI
	lAzxwS8JEcholh6sLeO/XZwZD4Tb6521CznEgQe6mfeVz6emu5upqP/rag+1l4m8f
X-Gm-Gg: AfdE7ckHEtVzVUSrdQ3UXl8wA7HBfiINSNjYWjQ5ucm23/nxVcVeK+kYz2e8Rr7fZYY
	32Dw0TZtrchPlARs3yEf+9dJwrTHXnu/6xW6G7xoESJNA27u7kVw/nHmUS6Q7UwAZTvISiD6WQB
	R9emygjZnGGueTVSKZUANK3coVgWM/b4gjm/pDKAqVeiYn9Gv/pGdEeLhpo1zSAKS6MtH5VvPQy
	DE56WB8AV+QBgZMAVQ9Prb9DOsL5AWuzSgajd3qPw+Ys/qMkD9ybE0WSsBt0NgCtqNo5xwkFxOZ
	JXWMB9pCpAp+4QstK1gD5QH7tyxqN/4CpN7aG+KB+SmXYva+sheSwjoyS2Axf8JfoKGLl5NXXJk
	2stcqBnx6UsHA7Oe2MGb95eH5r7bBtcDXaIy0uMwR8R7DN8Q/8hDFr+2JolNNqA==
X-Received: by 2002:a05:620a:1a1e:b0:921:24d9:a953 with SMTP id af79cd13be357-9293bb44bfcmr1005967485a.18.1782478802269;
        Fri, 26 Jun 2026 06:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:921:24d9:a953 with SMTP id af79cd13be357-9293bb44bfcmr1005959785a.18.1782478801736;
        Fri, 26 Jun 2026 06:00:01 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46caad603b3sm23106634f8f.7.2026.06.26.06.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:00:01 -0700 (PDT)
Message-ID: <0340bed1-4df4-44fe-bdcf-94fd3fe98578@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] MIPS: TXX9: Clean up txx9_iocled_init()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <1b51ebc5e63ab41070e099bcc4ec1e8d9b85add5.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <1b51ebc5e63ab41070e099bcc4ec1e8d9b85add5.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX6kI0BpIrLx9p
 zrUCAhNdsU358WqW8RhCo/Dvx9K8nl84gKiiRUujyT4FZGWY8ZHSIe8oGIqeXf5NuNO2EfZ7/aM
 VB9mJSeOnSOv2/ty5Fxek1DCRjjmjRg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNiBTYWx0ZWRfX0gwKTeFC3juv
 1EaBLzP8r7KxmC6hA2+Noy6cg4y9Y8U7UrgjcwQownj8AT1ItAqaCB77Z0NW5zzpUv/mBnSi+gQ
 d291u3WUurTiXiZHOUFQ07Ippi2NK5rJUJqaEVMEVlhIqsh0mSoqUm6/hmh2yo9boPPOgoViYcu
 ieq/thZ4VdGNiGgj+TkSOvjxpMXrHOUOnFvU5C0djemf+zHec7x2Ab/f7qTZZ4jAyMJZTFTsvDW
 VjGXP3+RAABlbo3AA8VFEElJC8U8Gsl7mMhMAuLodtTv9U7NK23RGAtXrkSLpZKYxY2q7pSYO9t
 0TQ5T0/Gy0jeevuS5rgc00nVjjd1PQSmCgQhZ+YRghw+b+pM0ZHFtzHuX8v0oJarXwxM5hM8bbX
 LDtAvHsiB7qBYP6rc9VCyxkDiXiZqHsaIS/HljuiNjI0auVZZbkUqEBOrUGyRXqvqpXVkTFQbPP
 J0I7SAg7dOCAokqkE/g==
X-Proofpoint-GUID: ZR7TmV4AT3SQRiYgm78N0VHY_UoeKImy
X-Proofpoint-ORIG-GUID: ZR7TmV4AT3SQRiYgm78N0VHY_UoeKImy
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e77d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Oj-tNtZlA1e06AYgeCfH:22
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
	TAGGED_FROM(0.00)[bounces-15229-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: BF3266CD470

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The sole caller already uses dynamic GPIO base allocation, so drop
> support for static allocation.
> While at it, drop the no longer used "lowactive" parameter.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/include/asm/txx9/generic.h |  3 +--
>   arch/mips/txx9/generic/setup.c       | 12 ++++--------
>   arch/mips/txx9/rbtx4927/setup.c      |  2 +-
>   3 files changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


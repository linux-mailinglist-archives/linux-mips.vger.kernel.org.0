Return-Path: <linux-mips+bounces-15122-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2coiGfaMMmq91wUAu9opvQ
	(envelope-from <linux-mips+bounces-15122-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:03:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2A699711
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:03:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NhXiDzof;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lj7PvKSH;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15122-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15122-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4EFB302EDFF
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 12:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA6B217F27;
	Wed, 17 Jun 2026 12:01:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9124239E7E
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697700; cv=none; b=cnxoAmSvuuCQeTDF8fgUY3YJ2x2Py7VBzl+cQnNsn1xS7OeXPINbwXwd6uu9WP0EeLar1oePCOUQ2FHIQHiL4aCg1vCOhBSK+Ji/19Cmp5N3tAcW2h4gVoQo90ayw1HXXe+SqBs3pOFAOz0Gb6ml1Gzp8A9bdFEkCQ13jvFzqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697700; c=relaxed/simple;
	bh=M+n4V2JDJwQRFCwqQxBU2IOmRIzxuEpEbI/ucRGLaXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAqLn8TaymaBm0XCxxLaO8+YLjZc3fo4bKf+elG9MRjckzq1PcrNrOJwuOmF2/HIRlHu6lLSkCGt7x0r7VcdjzMpYOug4C9XOK1jgQqA0JMS/NMjy6NYT6J7UFsGd1D9nd7uDEs5kjx1KPsLeL6hk3rxKpHeW+xZ7jxIhgkf86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhXiDzof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj7PvKSH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ug5b1654590
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xy+YRoc5S5toayk5HKQvHdzw4bucENxat3pUDhpI49Q=; b=NhXiDzofAx17IfSV
	OVtlyKgrBP57R0l70pk/KTxtQ2/yN4+NaSyT84YfX2+X+64yAxPYzFIwONOlJFTg
	A7vIpePhYguPkOeIUbeOrP0SRV0KFfq9g9ZTU1jBWJdfOjqDMgSoFkMrI5bCYPcq
	L3896cv44qohnhqO7NC/bJKFusnvjP7vrfdl244HaIbw4quFmeU7GX2Dwq5rwLxe
	Akyrk2CGi9AAbVD4PpNMQEE6oLZAYeAtq/FgWvZRHoP2TXQPdO5SQxlNwiLKCjmt
	X5se5BeMXs7szlpFmQpO5r4g49vstyz/WErgRmkRRwXUpuc7gjJrZqafQdOnkEeR
	+y9ibg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2x84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 12:01:38 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43ccd5d5357so5552654fac.0
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781697698; x=1782302498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xy+YRoc5S5toayk5HKQvHdzw4bucENxat3pUDhpI49Q=;
        b=Lj7PvKSHIgL5svL3vSBuWl74jBrQ9bgmo9QEZnmqz3bq3Gq45OaezUXmrYaK5x2DGY
         itE9OPlVKa1PqgnAZkgo4w4zk5Pn78XGUZoEhIRq1eKs5Xgg3CZymdMnE7hXDqGmC/Z/
         dY9DmKbhwRa+QxaRogtgTWiI1Vsz81eVJZSOilE0hOn4YQS9dcXwHYyuj+tyAla1A6IJ
         ZJPWJrMPfijtkq4MXv83TL2Xciug2PX7iq/wh1Srj6bmXuVlVWhju9kqrewv28XBEvoC
         qltB8pYC//4aJlty5GNk0AyqWXoV9kyZjCk48rk3seM9VVCYQv38Ow7v0qBG+DVssVMT
         eD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697698; x=1782302498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xy+YRoc5S5toayk5HKQvHdzw4bucENxat3pUDhpI49Q=;
        b=rSYnPpa45u+HhqmhinEwrU6qgqZRhFmeT4XnoI9eovojF8lgiZboIDAadxM8vh4BfH
         v9jLDTwLwqDiRgLPkpoO2VYwan5kikJYZkRrDKYljxj2+zFk6OGdC3it4QNAvBt8F9tL
         lvTp0K0dpDenHSbUzkqjN/qQSdVZbMZxjqzAJHqeQeVX1C+BBkgouqQ2F7T/iXK+Oq8/
         Hh0ZsDAwfX/O0AOcHEmJ+zXj6srr2WKDDQjHNJj7362kVLbgvEXTa4G+iGdUnJcnbVXo
         pVfibZAD2usRZJRzMQ+ZEVwW7ia4QlIN5YvO/Qu9C9zU9bZKN+xG8QQUETniP5Oo4lY9
         EWjA==
X-Forwarded-Encrypted: i=1; AFNElJ/iZ2vRDKDocVs08A7sOZOC1pmXpgYQgt2XVtRNcfdg3hNj56ufHVxGBx6n7tG5YeJIDHB4jLWTkJHf@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1N16s37L8wWZhSbpvX/oPnhtimcAlC4FAd01rbCItcE3oO0a
	djbtspNe5aN/vnqIO/+rHDKeVGUT99+3qEDeO2UEU0oH/EpKwNNNW1jJNmtEJT9u9T4irlvSJMo
	V9PCGXPAkyjYVMC50BeIvc4KVsAp3sHePCIICmCXwfpl3r0RmuOH7zVOn9ySqom1u
X-Gm-Gg: Acq92OFjJZXHS5f/owKZTyNtFg3cSt+qQkCbLIdnq4BpkHclicui8WektbeDbqIqTWI
	Gz/o1YL1pCIxMGP4EInOAKvvaWpZCpvgjHfi/V0iM8jkpL7M54I1iYAa5Gy3NE9lxNjDNcZQnr+
	LNnF4cAUAOYL8nXJ5dMr1+X3ylROrrTM6EY7RyZLwMsQaU4IZSNNGAu2twaZGdDD2BnprBUnhYP
	+dx5wX9O3HJ1q12agvOLXixZeKDiWvM8hUC//xQ1div9j0KZPm0NYSRo6f0ks0A3ohK3fbRvL3I
	kAARWmqPnKuLj29cGfwYJo9uLC3yjLUKCvvCf6iIWahd8Xz3Hr3MCgnn+1f+fOCxEy5krb+wjDy
	qyjRQkki5fj2VAX69HwQC/sVUlW7DvXYyx/uZxE6DF20eVJsFBDP33WpsUWpKbQ==
X-Received: by 2002:a05:6830:4491:b0:7e6:7dc7:4542 with SMTP id 46e09a7af769-7e90b3dff09mr3306967a34.16.1781697697997;
        Wed, 17 Jun 2026 05:01:37 -0700 (PDT)
X-Received: by 2002:a05:6830:4491:b0:7e6:7dc7:4542 with SMTP id 46e09a7af769-7e90b3dff09mr3306881a34.16.1781697697411;
        Wed, 17 Jun 2026 05:01:37 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461abb44c3dsm12421130f8f.9.2026.06.17.05.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:01:36 -0700 (PDT)
Message-ID: <be85c5a7-de59-43c6-8f62-8375b97f38d0@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add self for the sb1250-duart serial
 driver
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
 <alpine.DEB.2.21.2605241637170.1450@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2605241637170.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -g_G5qE0Dac0bIb9hkRMHR9FCO2goAhd
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a328ca2 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-GUID: -g_G5qE0Dac0bIb9hkRMHR9FCO2goAhd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfXxg+m3YFTssB6
 w3U/umefqob1RmHLerSe3TN/vKTdaonwrpDtAPxwY9lMfjuL7BLX9Tfc00DMMiRr2rfnOrVOhbz
 7c4VXMHOQ909l2P3iUTM97+rf0GdW3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfX3R6t09webWLb
 Oers/cCiV6Rg6v/Tq6AphzVmlZOXWjsGwBRF8i6Ehz575YyouYeRvj0f2WTjplmohuBBncshwdk
 dDr0E/MInQODfU9zlkw7se+TMj5nP1JjxgtrhKEs6mDu19nU0tWWOOzinq2nU3f+yE2D4vTUGDb
 bq5dvM2xUP9nZBWueUYzqYzQOh1HSrPegsZy5nq0xg5KnFgXq7EEQdWRcIbRARmEZYCJk+rrBP/
 Sho7wNcQjp/HJhGBrrZL0XcTif96AyRfm96Yu1SgT60zXu1uBE/GHYvA1NzZIPsBxOz0LcGAW39
 3isuftBNc+khrpAksKWnefQWNDaU3Z2JALJz0JanqUJ7KtRk0GLb5jYkqbJAsKD/4PYXNouym2Z
 //KIyavtmGnGxQGzFeiugdRchzC2SxCKVh2usHLa8JnUQvB/rT0ufEPAC/4MakvAbZ3DFsaz3Oj
 Fhy0VCCj34vqAUAdLMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15122-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,orcam.me.uk:email];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 33D2A699711

On 25/5/26 01:12, Maciej W. Rozycki wrote:
> I wrote this driver and seem to have been the main remaining user now.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> New change in v2.
> ---
>   MAINTAINERS |    5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


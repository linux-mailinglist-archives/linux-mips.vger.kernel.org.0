Return-Path: <linux-mips+bounces-15118-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D8KqD92MMmqx1wUAu9opvQ
	(envelope-from <linux-mips+bounces-15118-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:02:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4F6996ED
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SaDKIVMA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PLIb/mna";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15118-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15118-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E273138DBE
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 11:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6083A0B36;
	Wed, 17 Jun 2026 11:56:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB3396565
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:55:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697362; cv=none; b=uvWoiahkG1vnsTiBvRR425EiQ4mBlClh1herh2DvtRcCz6c8fpx2NZ78WT3c9hb26gyUUCf3y9Crd2jzyj1jGNOqA10Dvl9vp93EZmx3h7UmO07LdVDvn7GZIU3F0tXZXfEq9yeNigd+G8IXXAJCZ+AvRKNkGnXfRmd1qYDrH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697362; c=relaxed/simple;
	bh=bsVKcHP12CsAygE9OlX5KbDT6c8JfJq9fzPsfTp81Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCxHTPCNi7i7El35GKVoFlU/uBSwAZ2i1PHPcgyTACwnvx0IPZ/k8AJWlj/+66yJfnVzxCfnXczeyN261u1E6octEr4zzl+js2DgApQOJ8SuPJKQgBX2GAmRN4OZ+g+F3av35nhPZTvsFyHujB1xAqMq+/F0L8p2sQI5dnjvAvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaDKIVMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLIb/mna; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UPD21703215
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmGBvbELWd2AhWIWMgMsY6iGu2hpb1fqIaBTUXwLFCg=; b=SaDKIVMAVi4LQa/C
	ZmZHGrsZMRtFEtz6ozRsM+Qupz4BOADEwl/jbYblhUrwjUtfBNw3itkk1I9NK2tf
	zqQx8nLv1DAoz/6zT4QbKeHAZf6GkwBDTN4NTHya+0UrGQBNESHoDZbBN7xsQQJ7
	eaqHaFVSOeGYmYi/iHBkJaV7ARM0+pePmoTegMzwDunX9TDkh+tPhKAeJRkygLCS
	N93jDCDYCgUD76lquWgtazcJAFeDFhKEyQc7n9RIeO52dz9tfex2EGTN9XqRFu1C
	aqVqklCz/vkh5qtXNxjuhw7lZ/ZhdzPlfN1pH6fp2xSHA6PEOaLcBK+V+QxsZK0U
	EDarmg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2vj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:55:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso143660137.1
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781697357; x=1782302157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmGBvbELWd2AhWIWMgMsY6iGu2hpb1fqIaBTUXwLFCg=;
        b=PLIb/mnawOzd6SldYUfwv41+flYWNh0DlZtsFI1xo3QCalx0/BOeL0vKTWVOK+hOyx
         CkCBLeTwzvocAIJhie0eNEB5HHD+0x9kAk+rJHHmlY8kA3+CXJM6BaDntBvd2v/vC8E/
         A0uhgihpzyJYn5BsmreiMxEQJvKr0cLjXjuEZWqmN+CBWfbafimJLYwN5uu9IR5SRzeS
         9MbD5vW1h9NGMrkImCGfogR3AZT6echYUBFI5oZdaAOoeESQA3Ul17REHjICtJHoPkIy
         2dx6tCH0Qz/Zf2XYXx/bBjHNdiZOInxdMQNwgHH5ve3TnmVf9W38UNrT1W73O4gwl4TE
         DQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697357; x=1782302157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmGBvbELWd2AhWIWMgMsY6iGu2hpb1fqIaBTUXwLFCg=;
        b=swKR9G8QVVACZxVyC+SM5D3jQnTbZnLBWRlJQi8LeaitcdTyw8t6hOvJutbDbnyN24
         klzeMNiM6eqQWNaysKdjOS1JIOmEpLJVkBnsKiuUKFTMVk/H4UAp9Pghd8ZVBcxRZgv3
         fz9BcwZalnlnZpn+gzDKoJ9oTVCRJWbjCJ3V9GYvLj/tJGm9x4OinEbnQGIjEMyywKys
         MUKSjR8JE1Fjyta8XoIEPynJuSnTyNYwglAEl4jjn4xUCsxV2uret17sXLzw9a1y0qRF
         gzWu+MWhJHMII6/SSt3Om2a8Yefbu4IYGGQziyYKeOb8QCO3PE0IwVpBZ+zjJjH9cOPA
         DlXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YqhF9iMUlJIXFBi4bMaWI9ImsDvQlfLakk93vzQ8os2iWOAPIT9144WZ1EYydmuSM657FmxXlvW/2@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlyKZcRI3WzqtL9zCTj/jWq83LD3hebL1MxKqmiOTJi5eO9xg
	mkNY6f3PsGc/Dzn06yLKTK+JLuA9M/jYD6F/YgMuQkZCoYYiezYuGM4wZinZEHTHU7xU3J0BM8J
	Co7/oV9HvpuluvKImFhjY8OnKmHH6RJRXVeir55BqGSjsGVz8pks5iQVUxdW25vBq
X-Gm-Gg: AfdE7cnkGXzGiZf6GmPrGEaVlfYEju/5oX3MCDnkA/pn7dKC4llj3ojeIORRMPfGJFa
	qKCnx2CW8NUe/e+e8O8+Df+X43SrpZ8QZo76CQ3D+uKMORRU05TfFqA9wJbO7LZ1KfrG1UGx9ua
	REXCSTDqdVtqO8WHwJUjiVomZ4ToF8+WQXTS2iqGMLxih8+qJAYKJZQTBJqKLhz8Lakx+3IJu3F
	DYv/rumYgmEm739FrcXBTrT4aiv4s3Wl6CV2M8ukrvmKEGD1kS+y11y1i1hdpOSlBAPFI1UkzNJ
	1UCFIzwkA7inW5vGKKTD0qhV28bo35Rvp6I7x8P91HYiYoYKNyZ8pQM9/yxnPsu6xPmyhUJD/Ab
	qhMXmFKLNUtZ/IMYDpQkEZ25MNZujZ4ALD8e8NW4G2rnAIWSGVDpM1lMv945Syw==
X-Received: by 2002:a05:6102:5126:b0:631:28c1:154e with SMTP id ada2fe7eead31-7246a21458bmr1846920137.16.1781697356356;
        Wed, 17 Jun 2026 04:55:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5126:b0:631:28c1:154e with SMTP id ada2fe7eead31-7246a21458bmr1846803137.16.1781697355338;
        Wed, 17 Jun 2026 04:55:55 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm154442075e9.11.2026.06.17.04.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:55:54 -0700 (PDT)
Message-ID: <e5a9e467-ca1f-4773-97a0-316c0999c751@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] serial: sb1250-duart: Fix console message
 clobbering at channel resets
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
 <alpine.DEB.2.21.2605241620470.1450@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2605241620470.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9kyVojEtlHBcpb1Ts2JL0rMtdUbXXDkr
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a328b4e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=_c3b9wjhhov0UwWOKkwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-ORIG-GUID: 9kyVojEtlHBcpb1Ts2JL0rMtdUbXXDkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMyBTYWx0ZWRfX9vTQFNznx/Iq
 9XjQo5AxiNXDjleKxX3QRun8ekZziDhGvxrTamwigzDordO6zuAZNE6gOdkcYLzKlttsPy0dRJY
 Mn2FgGakrEfky7ncYGuUvmxR+aCWUKl4tP5vW26k4C7hsPL289kge3sE3SldkkSBkNprkX/hvjE
 HKkcxP2qHAA1ymU6BAq9xOXQG4bffh2K4aBizBV2JehoXUE4ezoDOIaABd5YwIuYH1yl/QgAl4A
 vXMfZmAAoHE4jrbaJf0pz80rgV/C/lCyQ/CTwiZPCInkNTBrN8DIIVZFH40LB99DYyIFrNKMzGj
 5g2yk1OfA4eQpgo9dPfyOgMgh+ThWg8t7tk6O6O0GsKtkNHFpaej3pm3bO8OqKg2BvD4G4MlKxq
 2LcUz09Pmkuarn/5zIb0Fc9eUtoJQp9ZXEytHSVwHKmlIJyHj7Fqb5xlYQLB+lpr/uarKHzz+0Y
 6MPi960vPipzCnx+kEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMyBTYWx0ZWRfXz+E36cda85q6
 PlasVKmPzAK2YPE3EOajO4iwFAi8h607P8DUBexk56QGkRZA6Ey3MQS0/6mxmj4hIEMgM6LB73w
 1DWGXgbW+UWKINs3vd2ZCC5h0v5fWrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15118-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,orcam.me.uk:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C9D4F6996ED

On 25/5/26 01:12, Maciej W. Rozycki wrote:
> Ensure any characters outstanding have been sent before issuing channel
> resets so as to prevent messages issued to the bootconsole from getting
> clobbered.
> 
> Contrary to device documentation at the time the transmitter empty bit
> is set only the transmit FIFO has been drained and there is still data
> outstanding in the transmitter shift register, so wait an extra amount
> of time for that register to drain too.  This also prevents subsequent
> messages produced to the console from getting clobbered, owing to what
> seems a transmitter synchronisation issue.
> 
> When called from sbd_serial_console_init() it is too early for fsleep()
> to work and even before lpj has been calculated and therefore the delay
> is actually not sufficient for the transmitter to drain and is merely a
> placeholder now.  This will be addressed in a follow-up change.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v6.5+
> ---
> Changes from v1 (1/4),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2604130321540.29980@angie.orcam.me.uk/>:
> 
> - Sanitise the change heading.
> ---
>   drivers/tty/serial/sb1250-duart.c |   22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


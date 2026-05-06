Return-Path: <linux-mips+bounces-14484-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJU4A7JV+2n+ZQMAu9opvQ
	(envelope-from <linux-mips+bounces-14484-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 16:52:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0E4DCA3F
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 16:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA16E302635F
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9533F2114;
	Wed,  6 May 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Js35QZhM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMd3kuQd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4448166A
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078365; cv=none; b=eLXffK1aUfVXGvDmZMj05cROTHin1yXclBfhap/E0BPllFA9KIGqGWHdJFwhjOhb5gBZg/TzprGi12IN5Ill7nq7OM0oxQNRPIopuYtrtn2PUIG2WBslAJGfZ0OC7CeMiOJHBV0RAm6HkiFXUpCcueUfumRPtNTZV8gr0dWTIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078365; c=relaxed/simple;
	bh=usS9J5G6h0+6xIgtwnQIWUzULlG33RsNfi/sRs5D5iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3AUU9aPzuvo3RIbdfFaZrHU9OXthUkTaUMIFXPYcmBFmtZ81xcxZOZPmo1Nq8xSp5rgnTXam2y8JoE9+nd2gKFruIa+slk2ORPTmAbdWFKU/v27wAGYfbBjcrwXJ/pVSYO+vES5VRzmPxaGEIfndcG6e4KNJJiQ1q885kVjtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Js35QZhM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMd3kuQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3VdE1953133
	for <linux-mips@vger.kernel.org>; Wed, 6 May 2026 14:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=; b=Js35QZhMvcwrVbQ+
	I5/dNbCaamWZmICHMBkIbgWez4EaYKo39b6v/pp1Fac1U3Im6JAYkplE8UAjYYtq
	niZ70b9m1PMGhBgzVX+LCmmzqts7xQDX9y/vX7ImBrErBSKWXi9GsXCyXtQmpMao
	urQhdfnV7Q1JUp1fcwPqS9flEH9kV6KOmxJ7ON7aTtkVq0ewa1zoRFKIsD/5okzr
	AhTZgFMmJIG0XEGSsZFenbXWetOVpo3Xn1EcWcX/koP8yKQRxlyqYWFNe3N2DZ1Q
	LEz4H7UyGuOUcignyYie5WUj8LCfyMUKcO5hSE9mJe4K6TbKQhiPXCl5dDomPQZf
	m5fyAA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc0yee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 06 May 2026 14:39:16 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5753ef2562aso3485778e0c.2
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2026 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078355; x=1778683155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=;
        b=JMd3kuQdlkFZINxJ/QbjRB27iWctx9xCLw9qCIKrd+fMxFeCp+cTwJ3A5+rEVmcJKv
         rqZ9Lmzlniz8+gxugkAotiEhwxVziOtFuGUGvTwnJ/deKlEm7spTy3U2wyI3RKQNTMDZ
         gDZclJByV2IvLToLWRoEq3Jn3XlwTU7KWaVJYgXa/kZM7H6XPoXw4fDfmMFyHt2rnlwG
         23yNzE+c6et9qrXTqaeFeUdGtv0qYR911LQhS/DeAVspQigTLmRZQMzymlrkHWy6ab2Q
         YAJwvYcqmRo3VZb9LWpxFpo6TyRyidOuGoNvNn4frBWVd44Uz/JW6yDq94OzuzuZwI1s
         9G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078355; x=1778683155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f30hXao+y0BYSa1EKP03KlZ+KykR9HVbfeAJbUKEoqI=;
        b=r+MfMslQLZz9vcHGVYHfhEwHV1yEZIZlKrWB/qBVs+yjv1FfA2gk+2wpeQELhEtkOF
         3kH0s7nWaQJ4KMhksJWOqdZj59IC4kfTt+Z+yfjKMziu4coyJLz7mL6DOMaFqZmZ0rCG
         Cml1HrfD+9ak5zkZsuQMyuERKFYEyxEoyu1d3KL0sMhPs53hw3t58bF0ti/RZQ14ezzZ
         lY1NQBmHF2wbDGfdNTcXsnsBtLnXarAOANxisGGHliomE0BtZUCOTHAfATMyOh6RJHIS
         JT7iKegpUowA/+3QEAahev0KEMx1Xfaq8NuYfUO+3iE7u6qwB/t97yFKMHN9uvrwpJ4W
         dsow==
X-Forwarded-Encrypted: i=1; AFNElJ9/9+vK7YeFC6rO1DJOu+9OIWIT84fJ9LtlcGKZfFZCzWgo11q37MfVqm42qQPndLGTON5I8Mvn6b+1@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnFeuIcKkmTyyeRwgQ1HkjEgJzGCdrNBkCqigwq1T+N+M4D5K
	RSoX9ZJ18UlklH7xqPeeXd05mjmSXt9922GoJPAUGt/g1uSqH+sxWSNR3fbPMwhKePwEDiRkyDZ
	FaodEIfLqy9RX5/KZIPJrVHPT/+u4QgrOgPzB7Vti6PUBjNwGv3qGHIxE1AiTB5BgvVXSLX89Xr
	I=
X-Gm-Gg: AeBDieuEx4Qb/1BzxpJx3j1/y0hScnjJ/8UjWL++ozXo5cq0y6gqNAVSe/UNm+Gfl20
	k5IJc1dJxojoZv5ubVXMvTJpawrgAOdphyCaTNJswClIPwTi9yhmC7yFa+NeSXpS5YEvxgPguYJ
	HHdnIBOCRL/wvj4fGm5LC7rsO84SO6VbCNSO1ygG3KnnyY3iVYUUv/WnQnZux40ex6RKP2txsyn
	0JbXk8gLdIyBKfCas4X7eGu7B4qs8kuEfcZPdJ8l6FmGQ4J0VlchLLBNCJufJ1qSH7IuHnEaiJv
	OYDMaI8EbjLvA4MnIvJiw3OM2OYldFEP9l3wQ53b0QZbuDoLhByFuedBHdF3+rWkd3L6f4n2XR6
	d4zGkszx3OAHhohnpYb8jsKJ9ErNE095rjjdQ0+xddD02xn3FtcY+yneS1s5/vq/1cSZJFSwGMB
	zyTMmg5fYcHBThM414wbMIVur9Lj8OqA==
X-Received: by 2002:a05:6122:1da5:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-57559611fbdmr1942826e0c.8.1778078355346;
        Wed, 06 May 2026 07:39:15 -0700 (PDT)
X-Received: by 2002:a05:6122:1da5:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-57559611fbdmr1942788e0c.8.1778078354922;
        Wed, 06 May 2026 07:39:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5390f854sm50161775e9.14.2026.05.06.07.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:39:14 -0700 (PDT)
Message-ID: <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
Date: Wed, 6 May 2026 16:39:13 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/timer-econet-en751221: Support irq number
 per timer
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com, daniel.lezcano@kernel.org, tglx@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260416175101.958073-1-cjd@cjdns.fr>
 <20260416175101.958073-3-cjd@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260416175101.958073-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NCBTYWx0ZWRfX6XslJ3CHEcIK
 KnNJZm7++4QSdCrXq3X/uJTE1ffa+8fmrCuHkdT7AZs5gIE70SUYDM2DitH+u/C7DwMpdI0u18p
 ELPPMWiNf3RzSxhdMy/ub4AAN/CgBOJZZWnkIZkzZQ18oF5e0dx4yDVAYVrtIZuDzB9g/L+u2fZ
 41ew0mdf1qhU5+A1VDYP4xzQHgLuhufaz+897etT5jNE2MRcBTW4bWeq8RPgUy4c+VDKUY9Qc+/
 z61NaAud9JpicB9uVlnQr0BV4ZB9izbyT9X8Tjm45ZTG2l3Als6Z2X89OA0Nbs2oqYHzk/aFFaq
 aKDTqnKyINv0OoI8/xxdrdbnkAYVwnfqWKQSV1kxgfxnB7zNLstMEZ3Z2NTO7SptfXxbIi84Bh/
 QA17AEo7dWeNicrfajItVvzwY4WaVxH17AJeHJ5nvxLYRUqFMAzbXsCyAVEydBjnlHs/VTxo2Lm
 C1e8aqr733NxIMbV2Jw==
X-Proofpoint-ORIG-GUID: pUvhZjs1hl5oai3PT3nKNmCrMBQTr2fc
X-Proofpoint-GUID: pUvhZjs1hl5oai3PT3nKNmCrMBQTr2fc
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb5294 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=L9NX2KsuAqd3V9ZBNpEA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060144
X-Rspamd-Queue-Id: 04E0E4DCA3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-14484-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/16/26 19:51, Caleb James DeLisle wrote:
> This timer was first developed on the EN751221 which is a MIPS 34Kc
> and therefore has a custom interrupt controller. The hardware for
> econet,en751221-intc implements percpu routing of the timer
> interrupts.
> 
> However, the EN751627 and EN7528 are MIPS 1004Kc based, and
> therefore use the standard mti,gic compatible interrupt controller.
> This interrupt controller uses a different IRQ number for each
> timer interrupt.
> 
> Add support for both models in this timer driver.

Given the changes done in this driver, the description is short and does 
not explain why the code is so impacted.

I suggest to split the changes in order to facilitate the review process

[ ... ]


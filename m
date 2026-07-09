Return-Path: <linux-mips+bounces-15688-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G/cVOiOGT2oPiwIAu9opvQ
	(envelope-from <linux-mips+bounces-15688-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:29:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107F73056A
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z6YXf3Ua;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LOiLi+5x;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15688-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15688-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B86833140F46
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7288E3939B9;
	Thu,  9 Jul 2026 11:09:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C840BCBB
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 11:09:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595390; cv=none; b=EbrqufvWiPqoFtnVbU+koqQwmlxBaxSqnZ5rrE0opFvfZ3I7D3baMZT7C2LeCrRJFQW5GgQzv7/YuCx7eEzh8PROSgMQAMWpDrB7IsHDPwR8iNTuim1usTqk6RxS565dQaZOVLFNn8UJfGrid/2TsfaGNLxgoviIbM+mqNo7yl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595390; c=relaxed/simple;
	bh=9RTwhbz9jaWqiUOXHUJlRVgjuhzoY/7f8RoLEjnF6cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hf3y9NG9In3ZtaIp2JG5UtLwMXyXzOHZNkQ42NBMoJMKdqlg54tfygMDEq2ZUBnvpny9iGLkRTCAVV8Aypmoa6qPsYDIISxvOgQTHtw9ZpOh6Ryg2qS+8yW3gwWXqzxiPFLX4BPHjCdhE8WN/HQaFidgdB1aTu3dz5weHsSv0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6YXf3Ua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOiLi+5x; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax93E1661306
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 11:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuQp2Wms+Bj/fABu7SVg20W/YnV9p/NiI5jp598VHoU=; b=Z6YXf3UagEeymvhA
	YSFHcfnY3LtrvGIa7uRzeAUk8VKh8X1JN4h1JNXtAN8mcglnTjUzWGgK7U59UVUx
	LN5Ve83V/ZIqEWsZ1V/R/lfEfkCSVi/PZv8P7HBCK80QM2AujzBf0RuXTlxuc5+U
	hWor3Om1OOS5AQK47Q2kXZR8mh7Fz7nHk7+mNq+r5QET4eujFA7E/5nNmBmzx9cy
	/Y1sVgc3tsWAP+NWR+1n1+NB0k2rRq7rZK8XDLlz3gFzGRUOA4Pg5a3H7MdKxN3/
	WyVNvjLjXZXl/DpdpvTeTh39VsGoV+3vrEwnuZf1v88dpQ7Wwjt/ZGMK61Lsq0FS
	ke1dsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vuevy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 11:09:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so35516061cf.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595387; x=1784200187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuQp2Wms+Bj/fABu7SVg20W/YnV9p/NiI5jp598VHoU=;
        b=LOiLi+5xKdjM4/aOfx47p7NC5LYJgl3ejDKBbx1rB+rB2aAD/vR8OrgCBw6fN4jSpO
         gePnnsePiwF7Sqgpp5u5piHta/c9/XFEsR0kwZN5fO1BUeOfLEjyyRalaWxu/WjG5vNT
         N40+eMpXMLU7/gZoMUimc+28hUOtEsq3mhEZPJA/ZMuVgRVKIdjUVZ6qQsU+xMRzIptI
         79ux0JfoT8VrEq8LGqacpqQMtfafdP9MGNIMr0A/ZxkkDhhMhOwM0NAr3gOdbOue+s5s
         ZVkHSAIOZ0bpAujegoL5PhR355qJ4tNIwCXH2/vXZK/PVura6Z9WPaiEFwC0ixvzSG7x
         9Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595387; x=1784200187;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuQp2Wms+Bj/fABu7SVg20W/YnV9p/NiI5jp598VHoU=;
        b=Yvtmc04WjPqljDLlX0dP3rk7JLur2Zu6BW1bruzDJNHJrSAukHCVjUcjwM49tWbWsR
         F3ysTvInS6O+bXoql2K/KieTGXnMx9IEr+TYWJcaxxhrIr8VUqV+r/cQVdGQ/vLCQ10k
         x/0iSDsDPyKMDWS/pKWTnWpl32yPv2SEfI2wmVqMuMKNzKILMVCGqPTIljtJgSY5tvCp
         aRwcZcQp+bMLu29og+49mjZuKmnddsmaGzsaIHSJAxPm4TdvImhhLoumz5xh1bKsQ/c3
         mjm5F9BK3lhjv4AkEPuBu9wIN1ABz3u1hfL1V21FO7up1JjhkqtOYHKzupAdnYxrsXk2
         hBgw==
X-Forwarded-Encrypted: i=1; AHgh+RrrBbHiLYGRBnUNILujfv0F9kzYjF4y6/ZK0hfOu4q4xnA2Bei/8TKM1vlljX01EQnRlzJglhG6qOAo@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkuusaWE/PSXjVRdU2aHkw+ppg3q6Rzx4u2Hi0upmaZiPfIxe
	X0vGiGX6pp12/SOl9KbVgw97f2pNUzK+ZgpVOok0UR3qmAY0SGQJRFvH4f3K3S09hRs8PnrQA0w
	44kAy+VR0UeHqJWuaPp2R1X1wzvWtDCTIHIM33CasgMCMg7VxKSGcGwX17XJDmVK8hVBqB856
X-Gm-Gg: AfdE7cmu9cfWRhe3ZTpaNTJf609XMcl8Lfvz54fiKmvByO0kBjjkF4SE4YYLraosP9n
	635kKMHFgn12iwYswLAml+2ce9WhXnmh1lf5UjdW1Hp9FgWFKyuHTHmtgKMRGueAqdD/zWRfRpe
	4fBRB0T9rSvxyvCl4mfvubg/+iQL0yrY3nkTNeUWIqcsrfv5vJMEwtntznHBus8YTl+cqKsfrUq
	OxZDNaDWDUAHE/LrWMUW8GXaTnpWRWwqG/LriMUZCQZlGD2hX7WAcP60C6dj80ZktJAzFJfoLUR
	mQ61LtJCcfOeJuousbvLmHtEvmdS687LpQAi8BM+awcWVr7aTGQhc9Oskr+VHELI//Q7vhH3P0f
	/Hmz07Gknsc9FHkzZKYpRrITmWTdqdj/SPrPljIuBsEZNyi9Ca6uW8H5RbVdSjg==
X-Received: by 2002:ac8:7fc7:0:b0:517:85e1:388f with SMTP id d75a77b69052e-51c8b3d7130mr68206181cf.30.1783595387528;
        Thu, 09 Jul 2026 04:09:47 -0700 (PDT)
X-Received: by 2002:ac8:7fc7:0:b0:517:85e1:388f with SMTP id d75a77b69052e-51c8b3d7130mr68205871cf.30.1783595387129;
        Thu, 09 Jul 2026 04:09:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ff6casm66134345e9.5.2026.07.09.04.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:09:46 -0700 (PDT)
Message-ID: <0aea2963-ede7-46d3-b2f1-28c362170ce1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:09:45 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] vDSO: Automatically select HAVE_GENERIC_VDSO if
 necessary
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-4-d2e1061f268b@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-4-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W8r3s4gSEJU19wt4JLUiwEPWuV7DPYRy
X-Proofpoint-ORIG-GUID: W8r3s4gSEJU19wt4JLUiwEPWuV7DPYRy
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f817c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfX87K3rHuthMFD
 R0t4XWcVXk+XMcG1ncX9BpJ3X8GRFlEwaA7gnlHnFd1EAJCL3laJI2k/Z8wYI1hulCK433eco5I
 isaHQQ0yndjY2QBqigoCqDNGK8zxYqNvi0qMaOjOx+2AvnTdoFvohmVjIMX9MpgmDCP5EZs/0JB
 N+XI+Ccv+PjPwIWDLif/zg4tJfo/REPxjUKfnBuy83oAEx1sRc1IXJUohCawjxD1PgpT+LnkTKO
 CYuRiFpGHdX3gRbI4FpAI9dJDP76ZnYJf6dopRnpUayxMSDvacgwRWTt0XLHpC/MUokZb8O/+wO
 BZLbLwzgaUr1hkCxYta+musSvUupO2L1fZGxudiXGER1mpg5ZQSqCCcD+7X8CgjRdukNF2fQlkF
 c8ubRDGCWFDgVwJv9zLroD1UMRv0KbTC0BPHeh0SuluC1Ba3PcfnhYRKvvJ/T01llB+mOEs+dBW
 Q3H/k+0VBF/Rjb3nq2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfX5vN+0OHyftOZ
 0DCA9Liz0urspzBX5cm4p4LgoLRoI9aml9lsJw5hhgXEUd1/+q03FD9nw9DSPB0otkqxTOMDUZx
 /HLTh2MUsAUYe0x9KKcxrOZ6vkUTPeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15688-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4107F73056A

On 9/7/26 09:28, Thomas WeiÃschuh wrote:
> gettimeofday() and getrandom() in the vDSO require the vDSO datastore.
> 
> Enable it automatically if either one of them is enabled so the
> architecture code doesn't need to know this.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/Kconfig | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


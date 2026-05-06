Return-Path: <linux-mips+bounces-14486-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DlgLUlh+2kuaQMAu9opvQ
	(envelope-from <linux-mips+bounces-14486-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 17:42:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFB4DD748
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 17:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAAE03024D57
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 15:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE542D97B5;
	Wed,  6 May 2026 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdfgqAN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZeR+M7Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5642C48122F
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081985; cv=none; b=rU4rt9AsiTaPqZuQM1Y6dfmqu97EzAe0k4cxdba6qkCtTDQuczdlFWNgWMLuvjxnXfnmQ7vkqBMtQAUtGu314R/pWmAoBycKQbf0K+oNZdVbaf1JZbQ5A9kHC5jwwXZ0FjGnmv9cRCTUXgCGWhJajb+Vj9k2xbVozeVnStdvdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081985; c=relaxed/simple;
	bh=k76zP0ySvEPeRY5uVy5i7dO3WcSb4FP2yZnMhkl4RYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdL6y8gNxd1mfbquNis7L/o5cTOhzqTwTdn6szduRxqk/q8UC8rsNhUtAq18mPLHQ/RHH2yZXqnNOxvrp/u5ceyCZqMcNqmyfWKmQS8fHMShwZQvQn45P3WAC1pyjy05/yvKaQ/ioiqBYv9hnEAchCA3CwNUXcQQIegYaJQfK90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdfgqAN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZeR+M7Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3Ywq1953179
	for <linux-mips@vger.kernel.org>; Wed, 6 May 2026 15:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=; b=EdfgqAN/Z0o9eV8f
	l6Pyc7N8WFODkTjS28eOwfvGJRbphuJZq3bk0YU70CxFhJdkKp+q4ZJ/0Fb49bP9
	3rGUGAFOetYJc6owHbQAdr8bOKC6nlXUygkYW/OWSRfDHz+7I/Z3iJyKB7tQjVGV
	kQFeCZuviGZrG3j8GKL7slwsTWr/HQbZek0cXxwODenyM8CHq1Dpu5yjzsvEFrKN
	/hvEHpWBrpD3upauUsw6lTS/oorVl4zwjkWbFKdCb99yCmE8XscXc2sWPo931u6x
	7TOy8M/T5XdoYSks6jZGlgmy6EG1zlC1FRWkTuNYpGA7odTHQ75qIVxOn5LuMfUH
	sEdmIw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc17yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 06 May 2026 15:39:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62b9e51689cso4535419137.3
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2026 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778081983; x=1778686783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=;
        b=eZeR+M7Y4xuKs/w2Z3ErvHtSafO2Kjr0VTPZP38Utn7TgsYQ/u33O+SaJOk+LXYYiH
         g6kOzp3baIj8dqRI+ZkPv/Aui4x/HT/yy6x7X9HtpGp+wQnu/ivfzCxPjVDsE0b0Lewm
         65NQrhAo6/Yr1PdYvKfTS3ZDyG4o4YFB5OAJzukUe4eyDZf9ylffgHM9P5bOF86c9ADP
         Ip0GFnoqQ2mNAWdAxCnr57l+RXYRT3yWfv/lWbLTednn80SHyAn2142qwMOmydGp7B70
         r98vValoxYHayZ4Po3iMRB6yi/SQcPi0CvP9vK6u3szddKc3L85wP5cMBlsfOgBaHHjo
         AUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081983; x=1778686783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94AnH3w9uqXLr6D1+b2sbJYpXuh9Altx0Ku1pSTSxqY=;
        b=lzblR6pQa1Yp2Z2OqrjjyfzhngkxTul4CfQfvFEOvgOgjFvqlMgR+4pK9XpN3Ubxao
         Mna6EQyA7if3vdZJzG2wNC4se3ho0AxCiMs89T3pvKJblXBoEptXkFWtmQpEyXPv7NAo
         B54GzQj/sttpHkFyfpTFGLDXbY2ibtyWAbGlX9BKo9MoRJY4D67xyt2kShPmvPKPNewE
         mLIjDIlxyIHZUJWPUKey3uVqkrmc1U9Z/wB/DiRFI52bCDpLgpkY+/prTatLg/R7/ran
         mc9WXpgvcRvUZaWHGPuGLloEGRcx+urTBpxFG7vN5aGvCirVzezjIVRLJJRh2AKnfWNa
         fPNA==
X-Forwarded-Encrypted: i=1; AFNElJ8molovSVefz0ZPDsKduxaotlql2x3qIrfnESIfkJqyPOEOqo7AXY9PHvBmR1R4TMfXShEVp+oCJgRz@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWJ8oyEo14ubI9EUdGuDR7SiVBOfMvLQMUmOzlCatM2gApOcM
	dxjQr2BcPrnHBQ0sKrWQAg+jdJ6dIngE7sZfVebC/7xzcH0GSgvl6sRDtQzWipuCTzEFtmW6bci
	G0LL62fDfkxGHhc4tXtyiYqhWXXEiR88JKM4cYCd3lYhDNJkgq1Sx5H5Zm1No+gDw
X-Gm-Gg: AeBDieuYXNnmbHwvzVUpCjjUzbpHNWvF43+MkeY2zbLSDCYYYkyJO67eLfD74F2KWWM
	nk+Y9hp51DPqaV7+CpPXsMPysZFovsRBKOMMfdBWfxsK0DgQvk6aBRfx9rrIYLqOndrrN1kYwgC
	mxVIxx4VYE6rXRo2oB4WtfT4chcejgQjX1DP4Tz2C8OMbDdRN1H1j0QDueNupd8Mvn2vYHG21VF
	UB5O0xjCsROkT/Q9S+244Czsyq+vv93iaOOcWTgvvERXmfta20q0hy4DtGli1uQ6b1zlbMAwTrR
	iUJm9cxpegS6x+JArU76LcwKVJACWhplGZQerr3T6iPeGKpeTnU0vLTiRse4juWvQp+fqL9t6Jc
	XeZ/Nmf8E4ZFsDw4z2Z9/zE/TZJv4jGKtavKqck+3iSmuqOh3bNWVE85F1bt1gSiKf4XwniqHMZ
	u9xIvZnuPITuNGOBtEbWE=
X-Received: by 2002:a05:6102:580f:b0:62e:bf5a:c23d with SMTP id ada2fe7eead31-630f90bceaamr1891644137.31.1778081982609;
        Wed, 06 May 2026 08:39:42 -0700 (PDT)
X-Received: by 2002:a05:6102:580f:b0:62e:bf5a:c23d with SMTP id ada2fe7eead31-630f90bceaamr1891615137.31.1778081982111;
        Wed, 06 May 2026 08:39:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm13410347f8f.26.2026.05.06.08.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:39:41 -0700 (PDT)
Message-ID: <89e792f3-3a8d-424f-abe4-b915bee63265@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:39:40 +0200
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
 <e5851014-3f9f-4e5b-bdfe-8c277f581155@oss.qualcomm.com>
 <b37dd665-3d25-4627-ab04-17431d9931f4@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <b37dd665-3d25-4627-ab04-17431d9931f4@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NCBTYWx0ZWRfXy+6vzOyYG+iN
 YsOkPML/8j5krtL0r2eZ1fnSXIxLfWwMEqTIVrrALfV5C9IOLb2WO8ZlGNTDr1/6+82/e3m0qNc
 EGqqAvE4sm34DAlgUnMFFJzjH16MFov99hd1y/SEUDBRSaa0DzgUHzX0y5dbVUF/Xf/mxq8M45m
 4SgFiGWnQQKtvxz5I5EQJ0oeK2YWLWuXyKnfAOYOhlCaHdhvIn8ckyIMDaF4OY9EGtabVAIFGMR
 dY68a2MsOUgwQ9LV6OHFrVkNs3tHER/U1FOkQvYfXjnT+gWyWNG8C64DYlPqewDcVw3Q8pgevoS
 yQ0qrmDjQbFZxlYaZJuhms0tEGrNy9iHmuqs4jW9KYu+sudeTq03RBhiRtst0aqh4dOy9IvyiJ2
 z+QcIz4lRW+6vO1qXfc7M6jYNPq42w3KcN5s5nLLRZ5095VOKhc1xGHf/PD+YN+wZgA4iLNcu0h
 FuTB4NJnHRJY737m5qQ==
X-Proofpoint-ORIG-GUID: 0mfaxMYzZZk_ZUdevCc2JaxW1Slli2u0
X-Proofpoint-GUID: 0mfaxMYzZZk_ZUdevCc2JaxW1Slli2u0
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb60bf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cnH1WqUiKSxbJj0qui4A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060154
X-Rspamd-Queue-Id: 91EFB4DD748
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-14486-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/6/26 17:27, Caleb James DeLisle wrote:
> Hello, thanks for having a look.
> 
> 
> On 06/05/2026 16:39, Daniel Lezcano wrote:
>> On 4/16/26 19:51, Caleb James DeLisle wrote:
>>> This timer was first developed on the EN751221 which is a MIPS 34Kc
>>> and therefore has a custom interrupt controller. The hardware for
>>> econet,en751221-intc implements percpu routing of the timer
>>> interrupts.
>>>
>>> However, the EN751627 and EN7528 are MIPS 1004Kc based, and
>>> therefore use the standard mti,gic compatible interrupt controller.
>>> This interrupt controller uses a different IRQ number for each
>>> timer interrupt.
>>>
>>> Add support for both models in this timer driver.
>>
>> Given the changes done in this driver, the description is short and 
>> does not explain why the code is so impacted.
> 
> 
> Fair enough. Supporting the two different IRQ models lead to an annoying 
> amount of changes.
> 
> 
>>
>> I suggest to split the changes in order to facilitate the review process
> 
> 
> Okay, I'll see what I can do in this regard.

Perfect, thanks !


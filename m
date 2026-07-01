Return-Path: <linux-mips+bounces-15382-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BjkUN9vHRGqC0woAu9opvQ
	(envelope-from <linux-mips+bounces-15382-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:55:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 294986EAE38
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CHrmkNT/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W4q0mENl;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15382-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15382-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18D7D3004D1C
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 07:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EBD3C09E5;
	Wed,  1 Jul 2026 07:51:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D73C141F
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 07:51:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892304; cv=none; b=MAUFU/O6QfO44+DliwgmWXW7sJxZ9sz/0U3eK0dUv14LKBDw8BO09/udIvoJ8qOym6rw36auxc4FK4fxjd8w9cCeN+K2UjoGsPrrL26N9p4T39yJin3Vte2PeQd/GxTNg8hfENsUpShk27P+uZVzhaVBna74bzqRuY1US3CZKHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892304; c=relaxed/simple;
	bh=cjosReaGgzzEhX5VIa/0e68NTsVETg6Gw16U7jnPHsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/dbsl+tMuq2N9hs8IEaOX2N7UMxBjyRuABrBIM5mwAHcxAwULsFXRkdJ2eCHnAMAOvPhrL6PPBqink9xhS8SFYYWsGH4tjCNaWS3C5VfynZ9/EiePvvzX5SyX0Wgy8NC/zGHM2Yn0AxKaYiBlk2TWL82RKdm+q+2HD2olZnaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHrmkNT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4q0mENl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lXQm137160
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=; b=CHrmkNT/8n82uDku
	5W/oxi04FrcTejUH736a5SP/Dy+IdwMaKBBx4VlX/kzWSVybP0ERM9fwN3EW28be
	nxp8N4flgNS8xHjUTYPB0hTXFaFH0K3VbYIjfdwVSGYa/kU2s/6l6B4vn/4eD77n
	8CN7VAuJMdRMXbZ1MI2Ql1w4vPnltoAe7CUmD/W7PdPwfFcnNFXzV9SXm2tbEaRU
	9U6CncWN1oDCGNXO3xt8q4o/xS5QJ3DTPoUXCms7wc9lreP4eMDOBSVgUt+BUGSN
	FY9IflqNWjSL0RY00wl2hBKCFMky8dE0xbgHmdI2nti6WFzd0HvmcwxhMCHOFHDv
	DFT4ag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0auj33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:51:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso3718451cf.3
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892297; x=1783497097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=;
        b=W4q0mENlPn8PesA4joqNAsZMbsgjFmlACtI91Z127yXgF7fjzU+3+Sev8X6TvNyq2c
         ECoejTQs2D6N3wm2gykkWqyLcnJAnhRPRF0rU51cQk1A6415wLasjMdTG4Y8ACLn1mq2
         Nh6cSVbBcXV47xajnLH9AaLxN7pA55IgAx9Q3Ycq0TQlho506QGfFmjKh2/Z2UmB1qiQ
         T2xcLvk8vF9lKbQq8BMNTmdy1u32Y0xYAO5ueCNWszKhiUaBaeJ5BGxhC6XWsGIDTDjV
         5VvRrOVy8y+XUp3ervZnvmF++DXguQUq3XHhTsqAhTew2TqR8ffGYf7EBN9BWXAXE5no
         X73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892297; x=1783497097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5Hajlt0GSOifEEgLYuCorRENs6/gAytzHqsua8a2iM=;
        b=UCv2K4rQw41EDyHogJhSZ3hrFCVE7NlMB9vXKT2BX4S5xCXv5cf7VLyca64aimwOsI
         cOWIgVDCMIhqAe+N/OBDyexTfQnmb1RRGEgssWH15NL5TCi0HtKWWvuLHAiV3cvujkZp
         VFi51DlIWYNF5y8xyw7P43lde3k0BNWBsRB5fl4ZuzD+SisVrUOLSJxidF3/HnMQq2zB
         uwIccuPTJsW9wsuae4G8TRH57vsKQGLmFDBYmPVuvZiBqWrcJbR2gJEYHOK9AVfEAGk7
         SfgoQ8VUw6PRq0h9pgYIZbFXyueMHqq5PK1A7hFf+8ytNOea+5XL7rtILwctTzVfZU0/
         DxPw==
X-Forwarded-Encrypted: i=1; AFNElJ+31qJEFhB5FDsVJZq603unaER9Xwth3ISmFyly/loEfL1hngeP2i6AqqRDMNmU7+5X2zBz6I7qsrhC@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGfUu/EzUot9PGdmcPzxWO/Wy1bXzi4XmvxZ1DHD5uED7bZni
	YQCul9+bXmxgwxcIxCv5LMH5t3pqlVwY0q57dvZmebLDQqRbSjxlxb8vjMU3QXWVJpx8geUfN7g
	ovGUpwm5eOfwutNm42PJ9xOZNQTnvYNbk5zpyGS7VXD5RLL9fBNr6vocxXA+wOh9c
X-Gm-Gg: AfdE7ckZmdgOwed6sHedijPqe/wvxYVUN5ZVZx+DauuBpVtedQ7q9+O9tFVHSCkQEfJ
	W+Hoi7ZEydEgH47zHoCcHO+U2RZt0srfjEP4C4AgXRHi8IKcwweuAlKGD7cpdC72sopTlquMD9Y
	xxLq9MNehCi8/HUYeSkMWDyYWLXRfB7pRIr7NJfP72L2eDsXSgxxUHLc0is/4EimUzp51HtN7ww
	fggl+EXf2CVeXMjJk3k9Nns3PLL7mPSvbyKwr5ZSE+2BmMSVxrccawC2/LhACm1soHBOKF1uXQN
	4C2zLA43hcaYQsZ/w8tJvOOaSpw2QlA0JszKo1PVieha1Uv3FTLZQiLW9Bu0fk9nX8CIpOc+NuS
	m4wDrz2eIDZeNT3tVo/TBUiZmhEtq3AeDhvQVGd8C5/uIYcYd1rIelExvp+4MNg==
X-Received: by 2002:a05:620a:2a08:b0:92b:6805:eaed with SMTP id af79cd13be357-92e785233cfmr72404785a.74.1782892297517;
        Wed, 01 Jul 2026 00:51:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:92b:6805:eaed with SMTP id af79cd13be357-92e785233cfmr72401385a.74.1782892297051;
        Wed, 01 Jul 2026 00:51:37 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6a3e8sm228444966b.19.2026.07.01.00.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:51:36 -0700 (PDT)
Message-ID: <7b5b211d-bbf1-42ea-9b1d-f8dfe744841c@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-9-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-9-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44c70a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 7SK9brE8wOmWtzbgSwBJI6woIXfFisOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX/XI5aFlZCEDG
 /+sw58KueH8SON7Ig1X9laBCGr3aOuwyNdHiD5hXOFWND0w0J8UH6uFu30w9yhq11DTBjuEd5Eg
 UCpfErT+vyqpF6+80YgZi8rQRQuoC60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX4oJ/g3XsxCHH
 5nQJYcfqRAnsK/HshjkBDcUx9dMfzlCbJvnbj/0jCc87QEi0oTJ4XGRitQASI50BfJDJ078/zXg
 A4yA6siuq3oQ2Cf+R7/TzVbZ/zfugzl8HszE4Pcv2oR58peYt92ilqr5Gmx703Q+RCvqOubVeJ1
 EFBRkkc9P4i24L5+ji68w4KWyS3vLZeFVPDlLeFlRzSRsXHpM6yq1PVhpRWc5V1y/BAy1A7oeZG
 QII8T831bLc6BFOklIFtoS+8I8kCYKmQPQ/PrcY62Ny+aEBLznetS/im3jr8BezE+QolfkZXuy7
 9ulWy0xJbn9MZF1uQxgCJSpVLR3nXBMrDvwvWsEo8XDlTrbe1U5wDQa9xi5XcVs3Ov5VjWUI51p
 248LJN9K6xm6OCxvtJk8k9EXyqu+QJK/V8BCo4eBq9DIEf/6mfu/5E8geP6msoak3V/4wMYJocq
 l+KA1zRNv0aqSq+Ri3w==
X-Proofpoint-GUID: 7SK9brE8wOmWtzbgSwBJI6woIXfFisOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15382-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linutronix.de:email];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,google.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 294986EAE38

On 30/6/26 09:38, Thomas WeiÃschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality.
> 
> Add some build-time validations to make sure the architecture-specific
> glue satisfies this requirement.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/gettimeofday.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


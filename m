Return-Path: <linux-mips+bounces-15378-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2I1NifGRGob0woAu9opvQ
	(envelope-from <linux-mips+bounces-15378-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:47:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 730286EAD4D
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:47:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WY2RJu67;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OkqRvQ8H;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15378-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15378-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8D033030F3A
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 07:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9A63BADB1;
	Wed,  1 Jul 2026 07:47:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161E3BA24E
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 07:47:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892069; cv=none; b=mj06afYp2E5dRfB2ZsuJjuVG+49HWHL+tcEgRBTquUyO/ZBXZS2vZLs13q2FBFc3gXGUwjKsa82y6NepWJpEQhUkB+orq3EOwy9t3ws3s4W42DisXP5xU0GUggoJKdKWC4XjIXQxOdwjnqnXREtX2Gml/wwrr0dy6DsgzLX9Emc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892069; c=relaxed/simple;
	bh=yfjzU0KmGln7hjJBe3II97fq/ldZg9TJRBjLk+zMvAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+1FlBAhZda+ey8rVlLKEyeCPW2X0Q3m5wgOK5dCs80GP6t8u8pEhmFDG2p5DuvwEYzno93w5vrQCcT0+CFAXpg1TrKiGFjnuB+GwX9iZBBhTWp5TcWSYPr+oHZ3jC7OU4MZGc/Du6ougz6sNfh81EMyKRW5aGVhZTogr8s2/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WY2RJu67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkqRvQ8H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lY8t025800
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 07:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=; b=WY2RJu67VLHvQJ32
	1OKJlZNJIXAJByudwZGbrQA9uRqrVfY/ixF77iI5yzwHe+hZBxp6KvNFcezUD24P
	PEvh54vbLG4Hegu9YXgz9DwuBxjAfz/Gpesnd2/UgmZc3kG768ZU+xyK5wjti5e9
	qavcXa6+3jBA+ZWUmFO0GxjlSfnl+HzYPgSFfdECy/A/P2KbtTdOCDL1LhPDVVeB
	rnf82+KAtN/ztk0Db+esChQG0Pm0WJX5o+dYEexsbZCYm+6RsySEC/W3NsrDz/Ux
	JFNknuOMWBn4e+0SebBjqK9NxtbhImI8oCFmyZMHA4q+lvbyykjW9gNB685Ddrh4
	VkCH8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3hsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so46082085a.1
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892066; x=1783496866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=;
        b=OkqRvQ8H4ABUJzWYBPQ9uygbmTf0fj/dtSvOk/gah2PO0sIPom4anMrcCxcfx/XJd9
         NcpA7/V56Ps5wSp0DKSUEGhrvNFn92/Pp5RQhuhDgPGRPgFGjk2x74OPcSRd9Bdj4hCc
         DhEOcEc233nf3SPB0EkKY4kUpNSnNN0vodLzB4k54PLcUHUfKOhqKnAjQlGdra4IxAnH
         5+2J+rxvBdxOuervPkElsOswDj5/0Psm6BBOvb0Okr6d6dRoBZ0J0yM6VSWSF3vCOCi+
         7/nlGYe2P8ZcB1Cmv/X2/lg6LzRhoARVrueWBH6r+7wLwZXGeAXKR7MQj28Zyhy+WPVn
         CCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892066; x=1783496866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEWtdTAHqA8hd6AGc7LBd9M+QPf+f5oKuJGFwhYdbIM=;
        b=sjyMRwwTyrOhM2hfOVtmkEmfLmGqztyCe3l/rEYcIS9c0Zv/78gEa8nUiHGGLyul82
         pJRBWDmxYIzsNqzIZrCPbHPW37okmI048/rK5Y9Mmu5pFfwWVJrw9Yn7arEScUtVur0R
         9xX/w4zK7Uuqifi2deuQ31anp81gqH0xpB18Dso1FFmIMKhWmFkUNQf4dMNXBo9uXG7R
         pnz8S6D4AhkRexE9GlH1Oa+srLfoP/yb1LKJcyW+IQzHP00ZGsned1gyWATHtYDa/i9J
         v4ipShTDp1cjLJaKDATBs4YdFsdJ9YJTcpPRJrWUyNhohQA7ucCD8giPhs+sH/2gDqdF
         s8sg==
X-Forwarded-Encrypted: i=1; AFNElJ/BCi+djv6CN0s85CkKdEDaXzgDQUv/aXXcGgGs/DzJ6ehRhOFhU/DfW4J1+O6ySTXOmnP1yAMrIGxR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KVuzN5xyfuHw73/YCUx+waXwNdskSUAoD4foFpWUmMHo1pKV
	aOpCdjEUG7Xh0X7y4e9Hd1ocrTQ1RdJf8C51vMO0haGQm+ELIyB4EAodohb0EnX2uIuyhM/Mu9X
	1SEC+9WLQQufi25uM8fHvxSlz+Z4Jw8jBdY5U55+IerhYLB1ImE/q87/78Ioxu4Nf
X-Gm-Gg: AfdE7clqLuQ0AENpHP4oZ8LBhRGW/qB3NV37c8vfeNPTpp1bZvlINXH2eAtML2Deirp
	Y2jjP9xOTqb2NXuw09/wX8vBx5sliKKkUw18FPiuVhQwH+dCZ0ibSvtjpnfY1irWvXncJQaUzmw
	Ds+hEZzNKgvg/EAtODXGCgcj4sBh8uiRe6iPfaGqxSyX1FrnbIQ9V1e0Kvu7z0iHnvJdlBs5FGF
	Q7wmBw4TphLpfl6yKJUIkSH7nipQOLnJkHP1XlyjtHP7xTTNFatDCBzgx3WXWJHxL6IpDkoTkw3
	6uLZHJpwEMfpOIc1G1Sb+B0/ODTH9kUW8VwrtSIoSU0G71GOazbdKapzJ8pb+/s4hVcRInOPVj+
	aUOazINJDOD+KNXwIiFmxdLFwuxTcPDzYelGf6PCwFDYqIay7Cy3fcVXxsCVu8w==
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr78274285a.9.1782892066295;
        Wed, 01 Jul 2026 00:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr78272185a.9.1782892065821;
        Wed, 01 Jul 2026 00:47:45 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm77510895e9.15.2026.07.01.00.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:47:42 -0700 (PDT)
Message-ID: <0d210cc9-5565-47e9-904f-3e8dbd910d6f@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:47:32 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] vdso/gettimeofday: Validate system call existence
 for time() and gettimeofday()
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
 <20260630-vdso-compat_32bit_time-v2-2-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-2-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX91qX3J7zCK4x
 syd042lwkjNL9YJRqaJlnQDYaMdMLsWwFzyhYZXVk07beeqDXwk+A1bhKb3gYRJytAwwtdBJY/k
 gq6E+fK3QhNuHn+qDB6m+wfjKKdl494=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44c623 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nV7M3V7dV4ZlPVs255YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: My3fhimWzxRZ8gTcltqUsSiqtaZuIU4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX950cvjP/QXgi
 ac7fdfJCEtlXF9jDYzvk2gaTmNXZAcWWwZcjClZ6kWt0m+2RxlbzmTuI5pdwGwoJaPI6WgxJmFM
 cCqr87oneXutci0sGUbKNPnRW28wc0MXo4To4b0Tip2LykQ3FBUFgmYFBDmk8fYlX7jchs/SIre
 v5gF52IWYxoEdB53X/hKiTCpny8YWSqL++E184TXtcRckAIF4gB9N14Jjg6+CbXHI7VBoNPneKL
 SwjhYB1YuhrOvcx//rkol31VThxD+HBdB6Ot5dxfeKuw7oAmkw+UAvkonkFU1GrBr1OYzI9luy8
 RJpEL80pVi/eDdtfVDd3znH1Z8vFXyXSq3KSwpDllMGQZivWu82Ti1/p4Rvy1XmBqZTkENwrGQW
 R+4Ev1qikrhpr0SodM0bCc0KGg8F4D2FnHfoaamRyS6WkQccs6g5dsWK1oWGbG9ycQvYip1pHh5
 U7MZDm7An4fyLCchogg==
X-Proofpoint-GUID: My3fhimWzxRZ8gTcltqUsSiqtaZuIU4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15378-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linutronix.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,google.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 730286EAD4D

On 30/6/26 09:38, Thomas WeiÃschuh wrote:
> Not all architectures have the system calls for time() and
> gettimeofday(). When the system call is missing, the vDSO function
> should also not be present.
> 
> Validate that.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/gettimeofday.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Return-Path: <linux-mips+bounces-15698-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i/shH0uET2pjigIAu9opvQ
	(envelope-from <linux-mips+bounces-15698-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:21:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9C7303BC
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iOWfjmK8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IV3ibm3j;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15698-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15698-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 662F33025396
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3B3411699;
	Thu,  9 Jul 2026 11:20:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E9414A1A
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 11:20:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596051; cv=none; b=bBXk1euS3R3fPq0vDriw/4gGUVqwIk84H6wIlyVlPG477JB5mOXsA2gLiIZQ7W3wU9W4rNSOq1w3LkjvBwovYqKXPcTYMXWeTpaiKaK2esT0rsHMqXNHZj3BJaw/kUTxrhO2DQR08DO0ZFluQL0/5fdUJghtM7pEmTKLZGu718g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596051; c=relaxed/simple;
	bh=R+aFi5Oqdv0TDSr7wZR2WAPngeBl4pJ5LsNFoxiZF8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7NsetSPneEZDu2q25KQg5coiHdpcKc65aBXuErjuf7me9LD6JyQQz+JBzrzFjTCbwPRDaJ/xKt0VLWYrhAlBit1JlOnUpkkgqzN4/bBDySritxh17qUdnKLnMYJJpSjjWOzIWrvXt2NVumzC1RAo/+9Dvi5Iiu63W7LogdKAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOWfjmK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IV3ibm3j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax1BQ1482592
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 11:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=; b=iOWfjmK8f8Y+DVJW
	EcnBVbRqoFetWpR+MvbIm0rNsCYEYiCVdv/jb+r7ZZuAst5pdACVTyVPX1hk4M4R
	UloW32yrnx0br0O0OZPBTsUXsGcPSz6fo0b7Z9SsSAlawkneGV3knPcGuKS4ecbQ
	qUgL7kJ1kZwezKuA1OHch6fG0wR/9IjoD0gaRXopgi656DtKQN7lmNG5nDcMpELo
	+2tydKrnvkk1mYPsPWN5nD/hRUDpTxejd9pRgo55t5XyFzKGEVSWfHJeObs1qXCX
	o+wuU7kKSC/wnWW5kZ8U0x7Pvu4fl9GPrm5rLmSBf6RmcKnNqHf8RgkEBJ09ZjsD
	t7y3cw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtb6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 11:20:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso17579781cf.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596048; x=1784200848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=IV3ibm3jgasq0s25tfTTsde+mb+cbf0EiYjotNWeOD6lhtkHYfP2NAvgo3fLSIlUov
         awVy4ec6gUG+6lxF88vREvFX/BnAW2XtnXM/E4JYk8LbH2pnNKv6JRm4+/odI7GT6WSw
         o9aCqNbOOPo5mJxVtnMjUCgjDg7UbJ+oDXXQhHorU2xCYBjgAs94FosLKC7YNfz1EuEO
         FWMkNhgguy/XKB6GOEnwwjaWaA5LXbHHvWA4FfdMgXQG+86Zds/kXMxljOv9W//PYxl2
         OBUyoAWmlW2J9N199MquiObfB1jyw8TCul4WpEMjMdIUFrcq3Ym9tBCiae7oUGfKnIgR
         uZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596048; x=1784200848;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=gWM9Qp9PJUW8Im3fVyDDJwMuQbnImGVFBq1SQ24WQPygqMRCJBupbLWtmgrmy9k7ZX
         TmElxX6ZtK9fCx7NLd+/KOTpqQ1SnkJhVeNGmWOI9uyK9qYO9bHtE+EgT5Qbob6SOywf
         t8nXCNLjYDop3g4e6/V0h7WHHYvsm78cuwzPTWAW/neg4CAqgYLtA9bJzpATXT8Q0SR6
         UFjyORU9rJL3fuqwbffeBAKj008jMTdX48ZBF/jH3ush/cW6j0iLwoei/CMWMLEN0i+s
         D8AHTABEmI73Ft9NLYkuxFpy3bKpu/gUuy3L0VMs0w9+8a6v5feQbYYYIGXaGpMfopJp
         uySQ==
X-Forwarded-Encrypted: i=1; AHgh+RqekcX1huzY9Ra0sKl0HoYIKAxQR88vfwla4/oleqjGOdgns0FNFZSfA0/YJjOyo6Iod2hTI3v9MURC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1kFSZNTYcg38YeSW4OMFo7eGcDm6Y0QW5bN/7Mkz2JA0eCLGt
	jGkBw4J5SvnCJ/5A+cwUbkJyYJ5PLg2mMJOnoC0DQzyEhKLFVbiWSf5yNevqhBG1vlQVr8pBjiD
	1AKZftJrjNleZX2Z85AKE2PCHbQGKttKWp2UMpra4pmWMrBDMJ6A+SU+MMcramLF9
X-Gm-Gg: AfdE7cl1ZnkyzIYadgEfY4H77teOyza3FK9aKjJwBX0hy+Y79mrFwLVb5njEI584HzY
	1R4lij4p5it8b+nYGCF6K2s+SnozZ9DP8pz5aeHFnq+0nLG9kI9OVauDDDmPCXW7crR/tyjePqu
	pICXDMgnEqMDugGW13CeUPlJ4AnV/NHvqfRh3oPkcTCzQki7LNxZIh0j25G4xWJXdE5efm+caRm
	cq1xG0701+Jypif0PP/wKt4XPjWc2tHgaQhb1QIHYLvQFDdACHZBScHWMgymLVIwXtuzCr4zHnj
	bp/H+flY7xzRsMvIi9E/18mdZd8vNh08RAPJo6iEjI2YpPKh4bRqy455jTNz/XqGxAKI9VpW+8x
	+LkOEzh3Sn/qud8T8ZHlHLuWBfjC58UXHk1vSDOn4WG+sQkBODcDJKpC/upURbw==
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754851cf.27.1783596047572;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754181cf.27.1783596047072;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm1861799a12.31.2026.07.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:20:46 -0700 (PDT)
Message-ID: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.181086755@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.181086755@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2vzxwr1Lh0hk
 Q4yAomdr2BnxJ9rSlzlPOLRjahsKc+pPQp+3kjBsBg+nWYTEhLhYenEuYVzP60glXK/uDWAieVq
 MDyeHGBybP7ZZq3R5ywYLKLsede6www=
X-Proofpoint-ORIG-GUID: tq1PUbTwr3APG41WULtg37C0Ca4YLYsl
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8410 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=uucGcSui7XbmpEV0VHgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tq1PUbTwr3APG41WULtg37C0Ca4YLYsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX11PxytOYPwVs
 d2NmlGcppIXWgCPckwXi9zbhqWY5uuGa49yY4vnJt0/amDbiJ7EOAqEprxxvHqLZVwtX8hpg522
 czEte0kyVbBe9Bg1pog2bUjYEgRJdLRl4zlwbE0Q/wruZYoHMzCE8h7Agp5hqPWY866HhwPRK06
 wrB4+QmhZXgtiyDaKXflTX3E/zTYEab+hu3BvMbmJGlEa3JT6uQO4gA9rUbN2f2rH1JgHad/gPr
 tMZEXRPPmHWAxlwnwfkc3EJ02k6GaHAuxMVNRQtJiKCCfEWsPhqNUGkv/FYjwQgpST7KCekNd+g
 L9Te3tRvCzu2yIsFyyGJDJXFrT5bHt/2b54QMD4i4nDCTQE5Uxb0dZ08azpYHt96R8nnfN6pXMP
 DTq96iI1Pc70whAjEmY7M4PeHs1QliY6+xVbDXMV+Km7X7iZA/6dUk5sVecfd46Z8nlUqD4Egjr
 pyCcG0XOo941fCy0NRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	TAGGED_FROM(0.00)[bounces-15698-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD9C7303BC

On 7/7/26 21:06, Thomas Gleixner wrote:
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)




Return-Path: <linux-mips+bounces-15224-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sys0Cr93PmqUGgkAu9opvQ
	(envelope-from <linux-mips+bounces-15224-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:59:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763596CD3CF
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:59:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MB5rT5Db;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fsAginrJ;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15224-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15224-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1A0F305D829
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 12:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23CD3F44CA;
	Fri, 26 Jun 2026 12:58:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691013F4DE4
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478695; cv=none; b=ssiDEG2kco+XZqDKsFk4xKOvE5kmElEbSaRk9kR3K1Wi1N+z4RZzGwgeci3w1pi81RdDJNRTMYo4dG4tSdH6HmsCitle/tC+mVjUNABxBMblrDq977oLrgiUYGtN8YIECoUwPmh6wRHH9PxxhssOGUEHbjsAUsx27LouiwbjYAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478695; c=relaxed/simple;
	bh=Xsi4plSt004PdKbPEvPkJiAI1d81eNaS0IM9EFBxgy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjUUVzf94Ye7LYaBGViG65qk9vshHbFhihRJnDwa7VnSPKDq5Sz/NLYOnFGDScVm1A3D+SQmOI4SpxAjyXisO4h0rLZwApvP1pwKcQKDyqqTepoB2Miu4cEV3d612WnHffZhQ4yTMYFcWVPSwUL8BA5ng09fBG5Bpxc99t2JMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MB5rT5Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsAginrJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAeArl500583
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=; b=MB5rT5Dbn0XJH9Ql
	9Ph9wMx2cbjYHILoxa747lVBrmhx7nx0Qd27m62rk32Ewt21RE/xeXN9TmdAa0Xa
	Pg/kvduSy3wCh3wBybScM4/GiZ7wkCeOVSrAe/WBTD5PZ/z3G5P9dPhYuNBVN6hl
	wb9JS4N+PHg/AM2udfClCKHfEbNdIqoTroEC55rdybqjHfdweQ25stv+Mk4oedBg
	XFx/lVyxjBmmViAwtMAthzWR/X+iidkNmgJp04MbTWvEwqw7IXwafbGx174Dp1Tp
	xHYoqjpHoGRZ7o9fS0fojDoDssM2GZN1G4L0l1+u+JomiiIZwt5Wy7qOZ6N3pi5z
	+ZqSHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1nj0gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517c65e497eso15797131cf.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782478693; x=1783083493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=;
        b=fsAginrJeA2sSpRxhSGzbnIPaPrO5Zzj18wWXDcsYUF8dpnuJAGA85e8/D7LEsI2G8
         rOdjxkn3bwOqrluBkM5Hi7OfFnUnM68tz9nMjtKVtyQoowqBoXCA2UijbpgSY3BYFSJy
         l279RhQU1NThc+IRN/9HZ8tl3LikAP7js1WCaptkCSI6vfJaqXDNLhdoVnpV55XovcPI
         WKEFIyguL6+E20kRUHD65Yn61ijqJBuN3IyswsvjkfgPWi3ayMaT15+s7FmnAOx+P2+t
         ZtKpDKi7+LjQuyO6MZ4dUUauDNm/4XRo/JuzfjcrYAdZ735ON9HkVu7HIiKek4Lgx+Dc
         Q4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478693; x=1783083493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUo/RJ8kDLHbJCXRVEoIGLCHtsWiRsM9ovY5zCH6yac=;
        b=layGGTrMZQFpLFdwLeDkoMzBeJ8pyYSw+FZ2v8u8s64E5QTLf3JShRv+1dlJ9pvz3E
         5VSG9C1VW5Dq/plt3y3WwajSkoaLLMvzMtSe3LQ3rAdEjNkqWEsHgjPENsaMAmNYMJKh
         F+ru1vJy8omHhh5oAPuSifWLCUP/0F/NMUFMSR/eJij/LZn3QOTfvEl0kgNKmIQtLrNp
         2EwcNiegpCOWw/48TdZmO80GwwNYGtKAVn9pQW5ae2CYgJdqzasRJPeVWg2dcjS79YWg
         08Y1AharkKsRhvnFjtAZP57fT1j2h8HxXVRmxo5nW2/+7HMazJLocIZYqv+cfys+ry3c
         Vj+Q==
X-Gm-Message-State: AOJu0YyDO2bTDlzaK2Khuk7PRjwCwhzPyf5N3jCFd3OJ5iJRpvf7/O2U
	SO5Z+RmrdDKWjCygGodn11+WC4waYN6DQM5/1GjbVCQCcTKGdH5ZpI5nnvUuJIwkad0HJdSLWAC
	Blqthfvh4+N3TA3QB1yuZBOBtVMWUq8UcCvXfW4f5GDI8TwiMXDMBnCh7DzXKAlIB
X-Gm-Gg: AfdE7ck+y55vho/K1gDgi9fa7Od84IcK4hlKm80TVQbuflEJsEoXgJ7GhrXMIQ/ihep
	uvOEYzI4MWbMJR3I1BzCfLqgg6m8GqlfvJsrNjNJTzXKmHUhfSS6ZVjXqqrp2VQq2PuYElBKDyV
	E1QZU9YXhpFsEclwV7Bbi0XI6dJfcEVvYi+KPiK9endKtbF/P3jidpRGa9pURccvQ9CRvYSb/t/
	oEE2V2nhL2Cih7O5qhn70eMe1foe/n3kjHoCemIRhgT/rhlNw7dsdRc340eaoPCisDGX+mhF7Cz
	xKu+NCXxcLdhgFKvN55Hz9DFa+J05mBhTDNGdAGtVhxJvQtoYb0i9Lkpt2GkL3gLLemf32mtBbm
	ysKW61+0sn4whUtuSs0cOUBMZiuQS0ag5PdZPuvZjkIJRTTOzLmOvuxFN6WA+Lg==
X-Received: by 2002:a05:622a:5c08:b0:51a:56d:1bec with SMTP id d75a77b69052e-51a8b09f1f1mr5862841cf.32.1782478692753;
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c08:b0:51a:56d:1bec with SMTP id d75a77b69052e-51a8b09f1f1mr5862571cf.32.1782478692362;
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51addb1csm95193201cf.23.2026.06.26.05.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:58:12 -0700 (PDT)
Message-ID: <608ab482-c739-4767-bb13-e6a6cd96dd86@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g1HwUdfLaFoXyQ4E5Efy47Fm3h-ISm2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfXxnGI92p/+pzu
 ITTxgGYmbd/hJFpL6hmQwMTOBtUmhnR/00uqJZIXdMAEuDmctfao48ni03SNzBxFOC0vVXaZobb
 +miYG8J9L3TClAh7lLGawnX2uY+OsDxap/fwV/LLxTPGx+VFAK+FpwUWAYz0iioi2fij6aZaJ+E
 s43grZL8+oVFpeJttCveMV+kgxCyzRd6CPZNeKhb/Qcr6TIIkhgJ3MVF/DO9rDEVzyS4uqAq6ut
 mm51MlqNyTYmhewJ1D4FYOeUxkak3K71ONlIKdDeDBOhg0KPKM/nRNhXfhA+guyOXrimnBrhmVE
 M4Ed5+IARGMb5h+tSWRDuxO87Poqay/kSgAsTUKLLxnJrz8kNa6HGJh0EdGE9l73/NhKZLi032u
 C/DmZ1FHFUr8jydDkRaZBLGS6WQjTlc++OPLNCbMBhA6yV6Ew1lWB5r7s/weo91hVgtD7QU7EmZ
 42TonXWbmpTpbiwr1sA==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e7765 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfXxCfv8CCqHy6U
 yT0OsU/9YhVMeXbqOEBXvYf7apIUetqQ9f2frgXpNdQ9DdEhxrOFWGR/r2j6Ho5Tgm3CdvMg2Ni
 NUqWWholMzvjzNcOG9JBc7NDvdEUum4=
X-Proofpoint-ORIG-GUID: g1HwUdfLaFoXyQ4E5Efy47Fm3h-ISm2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260105
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
	TAGGED_FROM(0.00)[bounces-15224-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,linux-m68k.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 763596CD3CF

On 25/6/26 14:19, Geert Uytterhoeven wrote:
> The number of available GPIOs and LEDs on the TXx9 IOC FPGA depends on
> the platform.  Since commit 455481fc9a807798 ("MIPS: Remove TX39XX
> support"), the only remaining platform (rbtx4927) supports just three.
> Hence reduce the maximum number, to reduce allocation size.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/mips/txx9/generic/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


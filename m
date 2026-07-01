Return-Path: <linux-mips+bounces-15397-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tcFzIeMnRWrF7woAu9opvQ
	(envelope-from <linux-mips+bounces-15397-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 16:44:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7496EEE86
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 16:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mYQ26yBT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MhFIoht1;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15397-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15397-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF4F63135FE4
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 14:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1E4349CE8;
	Wed,  1 Jul 2026 14:27:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E04349CD9
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 14:27:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916027; cv=none; b=AXV3evxJ4gY+qj3rd9btxRx3/tLWMWQpNsJs8qO0+0dYgZyXmImMXIFjEtzHEr6JUzD/ti9Yfa/9kUNuSwoPNXEAq0vvw/plUGp8sMoVDXfOaF/psWX0tDuVeFFSUOLpefZXAidxxrNj2WKFdos4ieIicSu8riOn7e26yfyZe3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916027; c=relaxed/simple;
	bh=LxR0HQjds7iDpHnAv6cX1K/uukZOWhEkk675u+KOaEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHMQNIbFsXUBfvj8fSmehxfDDIP4FKGuYiL/ne8FNPcMGHm87CobtUVIXxzgREcnzu5gzG8k1M+wfjDEWaXHkuKVjS/Wk+SzYXNff4ImZVD47u5xJfx3GYW5jqcfQWLwWXcR652U+8/HTleXIXcGjOYOUz2yTzHR7LpqcGr7xfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYQ26yBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhFIoht1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8qja721951
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 14:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARJ0YrKMy6bPuKjWvKICU+kxMxvoRAPGJc8Te9F23WU=; b=mYQ26yBTeXg4jloa
	Q20mxCM0eNaGsUxqJWG6+2ed9l1Qet/EEzvFpFP7905g1wdvmRh6ALJj/rsGvkeU
	6LwAbmVUrZhuKTpN8EOdC49bR+J7zZzanIoZStZSxBRD9VLG/25HAUJwOEdzcQda
	KvSNodpdZZ0cSg7JBTQ9F4BQN6mo2Tpayp1RgTc3YGtG27Aa0zzavoNtL8MXkSau
	8hAHaaZGzOs1Ox/8l3+O+MWFejtqTsTDpqxn2t52Of29MclHlUc8RoNgcazla3GI
	1onqyM1oBzXg0Ja2WBT97RvEvKSFQDiVfZwKgfJya4VtcO/PxQosO+R0fSUkhykv
	22F6kw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwchmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 14:27:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so684443e0c.1
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782916023; x=1783520823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARJ0YrKMy6bPuKjWvKICU+kxMxvoRAPGJc8Te9F23WU=;
        b=MhFIoht14RG62JveTKJ6QTQi4uTHwTIPKsn2sEv3QaZhlYm/oBp6UnQgFMunzPsUuB
         u61q4nCf3jb/7QPJ75vllPCXQENuZgyukejWk8p1ZNpy2mtlVnU+g6XCjwipYrHH9Bsh
         NObghKI8ByCGmKlsSHHnIsIRST7nVJzL5xs16xqcgFRqKgDd2yZTEASvmW4yQsBSb0ll
         MH9j0Kgp2XOgADHIbh0IeOmoWJ+tUjAE9UCKWGnm7GwiU0SCHgMl62DccwFPxOF+WkWx
         x8pZ/wsJuozeyS1lfuzQwzifEyiV2UyoZFNpgtTX+T7wQTtyxSP5ffYP+8VrIyz1DGSl
         M2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916023; x=1783520823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARJ0YrKMy6bPuKjWvKICU+kxMxvoRAPGJc8Te9F23WU=;
        b=GEXPTuvpiNyqwU2aRTJoTAt26Dp+hRaP7jjLzLgFnMhzHRcGwChaDIookjc4ipsJdX
         MlrDIW4QmufPCuudF0n6lwaI8dJFbPh73tUiiuG99+jgAf9uxYzewUovHgeRAEcJPgK/
         oLQ4rXLExktffMGMQEJ1pGlXX2mZZ2imbpiEx/lXwxbA2Rcgrsmcadsz7BN5JIhC2ZdD
         k6zdeJrmUsukTiOUNxBNFzAEaO4hJgKZfEx+RGo9437nyGtGckTp4SZuVAkaAonpmen2
         PUjMOlXgAugnxP/do2QyEFVrJqoe+PY0QVeA+zSyi9OSByMWCIXOoDvazfhgxfXQOUpL
         47dQ==
X-Gm-Message-State: AOJu0Yz1GO+SqLHqTCKLRUVnjaMYpfxoqBoo6DkBQvWrypE27W9hhJ3u
	Vypfxk2lfJfSXYWHQbHlBo/M7Y5E5GJFlQsQTho3oLd0S6bBlKcp9353q6rCvjECWA9uepimMCV
	yrxPn9yOGWNP724u7tbakUa7UvJwanLRPYeskFGooiIFffa+IndTkuOob/8aT/avp
X-Gm-Gg: AfdE7cllWH/N2vzMTHmwYtq/AJr4EbXSzu5LlNn7Lk1f+Dm/W4BV40FAYb8s4G23/b2
	EVghpwKTdHXmgChUixI1/XJCMaRU14L5lbrHelFjR/+96VCPyUxwoqc+bypsLT9pBmVOIzaSEJb
	aKR1c5Bpkw5piJfJiR9vkKX4C2amzkf/XW5oBiVAkQmMJnxHwfM7VAdsfU5toQ0A9TfuHdhX0FA
	oCouspe+Bpyo2y63Db0HoBgaYr/tV3HKI4mqpocOITDhhb6UzGmvHjpfrD0iK4e88lIhoJ8BIN3
	MC2CdOBjswtgY7uFXRu3ebI0OipQV+pPCs8kgBf/zTU7YfoNVH3VnaXdqEa5Fy79WD/437tlJ47
	KzCTeE05kpNoXz1CSCqddlYuP6eDtVH51hDHzECBxoi8Ov3cO1CLuVBt/7cqHcA==
X-Received: by 2002:a05:6122:e462:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5bddf699ab8mr913870e0c.11.1782916023552;
        Wed, 01 Jul 2026 07:27:03 -0700 (PDT)
X-Received: by 2002:a05:6122:e462:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5bddf699ab8mr913842e0c.11.1782916023143;
        Wed, 01 Jul 2026 07:27:03 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810be8sm75500525e9.9.2026.07.01.07.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:27:02 -0700 (PDT)
Message-ID: <59d2b396-49a3-496a-9201-aae017f44d7b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for
 TXx9 LEDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <cover.1782900491.git.geert@linux-m68k.org>
 <92613064355ad1228b0f43031fc6c5d781e7d4f6.1782900491.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <92613064355ad1228b0f43031fc6c5d781e7d4f6.1782900491.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P2dTIqvKLa7fB3A0gtkq2sy7NSebpWA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX5ECPi4Ho7DIj
 tNDM6utS4y0JOVmToQ1tdIhnLQVXTxLWQR1yBDwEWgFE/jXLilDP6bMXcsmx//KjX4UxyMDGhm/
 js0RBOFVTKtzmcUNe67QNTWhTifrUPE=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4523b8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: P2dTIqvKLa7fB3A0gtkq2sy7NSebpWA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX4ZaL/b58w5hL
 H608RA4L5LimdVeCsZn3YFBNbFm3V+JzlO0p4eptFNWQb/beqst17lJn5YVx3KdMHmIOXB5tYz1
 nADkuvbOi/jn8BWgmdrG4yy7rDzyh6u1pUtjxFv+IXfQ8gRpbxs/u+nWdgFoXwiTj6EqempzqRa
 k+Htpv8n4A7Mk6FUgw/Xz5MA0kVyB3hVzmdU1QmHveEuD05k9cQnm1BY4i/bvmIUj1cOvtt1Z/I
 I+clLCB6Y9Dri7LqWeMy7Nu3EO3t2BX4kZIF/hWpZtDmLLCuR8vtaXV2g2MmBqpQT3gGsarPtlD
 4s0nNNDCaVXugI10m6PEXk0P4m6NmGD5bmOwDVma6uOdFeuoWp6X/k/RDGaGqjifNBtjYMcSZF8
 biDv7WTTyP3lPUVFh1Bwu3dAKSKc8qrS/N45raNTLcy+b0gh+9NZLAjRj0uJ+1mcaTHvq6bcIkI
 MM1OUpzZc0NU3pSefuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15397-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF7496EEE86

On 1/7/26 12:11, Geert Uytterhoeven wrote:
> Convert TXx9 LED description from legacy GPIO numbers to GPIO
> descriptors using a GPIO lookup table.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> v2:
>    - Add Reviewed-by,
>    - Return early on platform_device_add() failure.
> ---
>   arch/mips/txx9/rbtx4927/setup.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


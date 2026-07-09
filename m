Return-Path: <linux-mips+bounces-15689-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z9GoMqiGT2osiwIAu9opvQ
	(envelope-from <linux-mips+bounces-15689-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:31:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EF7305CD
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bIv7jAeX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eAHCoxHG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15689-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15689-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317D43185A7A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121CF408028;
	Thu,  9 Jul 2026 11:10:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F330D3F5
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 11:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595446; cv=none; b=XDzzeVqUn1zCzLlCeES9bQkEGlMa/qKZTLIB43kPFUQFAv3XIhb5opbtfzwc8gN53NsXArM6JLIprySUOEG4HTTsEtqPB2kVlbmdH9nBCsugoS38hjLMxUI36zgv4NbHE/wK4EqrHaG+etJZEO1SZQ9bBeQQ4A1tnqh3a536DQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595446; c=relaxed/simple;
	bh=ufBBuC7DuaqMp/8jgXqquBaONyZprwNIoitt7d9JrJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuTTd4GgvgcQS0JRLrEvMCyAm48mYExb5iONLIOKpYcyP/dsJdXZ1tvXJCCIcO4FDKejVIq62Oynz9BYr3EjTAtE4+zcwgGigW0uxkD1BU3z8yAuY9rqP3ZoiPM/jkAPmQ8zJ+/xGIxmWjgDTzWjTym7r8v+mrBrDdn3gp+R/Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIv7jAeX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAHCoxHG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxAnn1603601
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 11:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W69CYKJK7FAMiHyCczy0ZSbxp7b3wYdJqaKCSzuufUc=; b=bIv7jAeX+M0Sx++N
	Bh6Cv966qkE5kWYhTBv6Tdw2e40GRYlVHuX1+/G5Pdp282DEA8s9W5AftWuduCxk
	SqeotKWjSKpDxyBGMIw+G+Ls2N+qZr6hlefl2hwD0GmmKOMVetCz05KNMYiN4jhn
	4PbjrOqhfhBRq5633JMd5pq+55E2j7W8h3kpeSZMF1J1XiAlDBZBXjaJCvzsjhGy
	yaBxjfzrvbHIB4U8XhwsqPxKW/0cMt9nlU+misoTKBLEa4j2bkS3DWwlOsKBK3IX
	CnHRpbSdzxzfzwoBNw5ev7ayjK6gL3P1TDulV3dMscdszDtKg5PCWMhYM1R0wD+Q
	lbVC3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3s6jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 11:10:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so18273761cf.3
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595443; x=1784200243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W69CYKJK7FAMiHyCczy0ZSbxp7b3wYdJqaKCSzuufUc=;
        b=eAHCoxHGgocbj3rPcmYnsvFSZBbRZN5inCxtwgApmoOiKx24Chss1haxKa51NSmhlA
         KbER/j4HTwC42M+NQ/5oJtCG95PndmgjIz+XHcE45N0i1WcLe+o0yXCd5V4gpOiih5pM
         B3OsBBExtZEbmAe/UVEw/Op+C+bOJp4aaf387fp/MmM7DSTRhlkMDx1XnNUboGg6CbXZ
         7yQE7AWmk/TQYiPisLw3H7DQWOwArbb8ETThUS4vEmCIUBGlR0HP+J00eY8tP/lJT58F
         GiIMIUNdP5VQ38M0hfWZICvba/mJ5fRMv4VqhnXGI9+vohP+PBdkwB0LkdLk+Vqxta3i
         6Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595443; x=1784200243;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W69CYKJK7FAMiHyCczy0ZSbxp7b3wYdJqaKCSzuufUc=;
        b=XIHc3lkQlqVewIzKQTMHX3sA+kH4wwyzJUM7eWkAeAA7vDC0dNZuqVGGIPCJ57kYvr
         0W+S6hLphgH/ZafpsS+6+7YC7EkYpaZ0kf76DhADvRaTRk1sbjuaiAH/EgOQ8RrL0jRS
         xjoWQM2tI7smJFy1EzBM8FWT9i/Ftlwk/wKjkOK0u+cUQv0Wvi/WmaZWlt8elrXWDrfd
         ZJATlgzU35s5a622AK9VBicrumipqm1TWAanUCyDQw5oJv2gkpLPG5ONXsma6ddwysVW
         G8QEm9T/RtDglo+ybXcMrEULhwQ/rZRrhUhfz3CaYE3djo18+0Y0asREdqtbZROH+1Co
         5uKA==
X-Forwarded-Encrypted: i=1; AHgh+Roj4j0jzQEUrxOtdX7w8rdOOZdzEoMjm2FftJIBq/RtnfPL9nf3EI+AK16lm9AsJiIp7U/3+rfJBeRu@vger.kernel.org
X-Gm-Message-State: AOJu0YwEZq9KCeaBJg65aVhxS2KGqoBDXiheSJJffgMwpKuQd0BmscHd
	kp+wbH9L70DaO6N1bsjgBi/UkPQr6eZbwainabHGUJMpICkBjACXyCNhlW9niUOjsfmtRhRMP8M
	B4jxKBomAL7uRBlAZ0eiUTb14bEKAAoxC5dEkNwqL9AUijGaMsda9kqreQsc6+Wxt
X-Gm-Gg: AfdE7cmDzTKR1PTqmfO3tF4mJvuxGALUz9yTxmOsRFuhWvi9jWgsIdId3GQeo5DybNq
	KZ3jBsFoSbdX5WT/Oqsyjb/3S40e9MINyk/jyhQUvgOsPenSE7uLMNkccMwIi94Xzz3Takvu5Ho
	XEEEMkm5tQY+N0cNnNBstFRdyzpKiUKmQYS8aFVrN1TELOPtM35qg7iqisnwvSMIS/31lYaJq+s
	oyJzXXSMFK+a/ExRMHvCCnOGAhcjeZwMH++uz9nlHBhiP4ASobL1kWyN9wVHnLTkaEkMwdcRWMd
	vZ3WhD1q7ABn5yK0TYmPew8fQeH4oJPNUSCrdGdAB68gLoVs6I8MvoD4N95c2SsARwdVrBusmSm
	mjMixA8/nkfNIdiAW780gkUQ7tdv55dSFlWmGPONx4rpbSq4qpPiWPcew3w9u5g==
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr73242881cf.12.1783595443113;
        Thu, 09 Jul 2026 04:10:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr73242521cf.12.1783595442651;
        Thu, 09 Jul 2026 04:10:42 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm374261166b.6.2026.07.09.04.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:10:41 -0700 (PDT)
Message-ID: <ffc4790d-6101-41dd-924a-eed1c913c14e@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:10:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] vDSO: Rename HAVE_GENERIC_VDSO to VDSO_DATASTORE
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-6-d2e1061f268b@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-6-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uDfAN_enKEUyuPwfh9GJLDvV1KUnVbgt
X-Proofpoint-GUID: uDfAN_enKEUyuPwfh9GJLDvV1KUnVbgt
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f81b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfXxQFbFVqMpBXw
 MqX48iWL6dn6Qs1Y3OfTI0kQbiQc6vO/Vo1D4j6mKBdb+ftUH+SM7IbpJkXqcFaxcxT+DW5TKHH
 abnJs43r0HVVeu5yc9O4lagblLg6ArQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfX2483FCruH9Dk
 w9Il0CBMTvAyQJ3BC8fIdknHJxHI/6Pe/YsGvLhrsTRNJSNz20nCfd++C7mT4+jeYfKWvO1a6/T
 NHQ1nTpsdLJl3hhcL9td85PDns8seqzNAS2o1edmOCf5dgS26b6aVq5PcIWYzEB/xoF6NyEqC0P
 RU4LOq2JEG8EtMMKDs0E4388pzJXqIweoeX200Mx9Ff9cOaa9WiIkVjii9l14Haw9KujfgYiwfE
 rsMlwcBCy1EVUEoBGtn9a0ttl75lhvTKczbVXDKJOA/Et9YdG7aUk3ZHdQ1oSfW/cqBJ0GW993l
 OBvKdV9OSgUA5jFbEKWARDhQ+awDnoC/bXMPw1gBKUH32wmYTPoolYyfrqYAS9GT/jfbHenIqy+
 kUAw6NdmsMS5wRvYTjswexQCXKH/0yYbsKt6Ypy6bGIGLXb/F3XgsYxD+Z50mJT138hkoqjJyZf
 ooKnkzFLRbuFh/ASa9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15689-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 004EF7305CD

On 9/7/26 09:28, Thomas WeiÃschuh wrote:
> Over time the meaning of HAVE_GENERIC_VDSO has become off.
> Today it only controls the availability of the vDSO datastore.
> 
> Rename the symbol to match its function.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/loongarch/Kconfig         | 2 +-
>   arch/powerpc/Kconfig           | 2 +-
>   arch/riscv/Kconfig             | 2 +-
>   include/linux/vdso_datastore.h | 6 +++---
>   lib/vdso/Kconfig               | 6 +++---
>   lib/vdso/Makefile              | 2 +-
>   6 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


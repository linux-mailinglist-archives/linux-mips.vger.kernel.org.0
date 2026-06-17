Return-Path: <linux-mips+bounces-15120-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DVcZKFuMMmqV1wUAu9opvQ
	(envelope-from <linux-mips+bounces-15120-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:00:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C8699684
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C3jMZgcC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CSyog5W6;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15120-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15120-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E57F30322D8
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 11:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4283F39D1;
	Wed, 17 Jun 2026 11:59:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E123EFD3D
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:59:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697575; cv=none; b=ICG/YjvWvKLyqXRheWOVa66gEcjZcClc1xMnV+qzx3fmvYlO3izq8W+1QAdqAub3sAn2JM9UjHVYYOKRj833ELkwiNE8epWxMes5BtBs26fav6R53aPzXRRNnz7v0NZzTFN+RsvhuQWlfHPNPfp2Y2UiHHhcX+7ZH8HtTmgYdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697575; c=relaxed/simple;
	bh=bsBdAJSSfzQdXVnZgwbkNcPQGRwa1KT8A24+fq9mJ4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkR/W95vJqQ438JgykL/WF9/XJywFD9iUIa1afU5tca287sNWRkI0yT5ZEGmQsFhdQG/s0JZ7XH0892QQku7r9CPyNR+bSgZEpKdcXb6fXDsVCQuD2AvSp8GmbFPWqijxMWYxf6BOXz9GbN1suoOePB7I2BLT1OoA1BS+auGeSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3jMZgcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSyog5W6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VcY82190970
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZ1B3IAw4oJQ2vLZXJ7tczm7eJQgSGAReWX6mfVUAoM=; b=C3jMZgcCDWKJE643
	x6sF0cE80c4MWoghm9kWbc8QoKIkvfQRWoUvHV+xOYs8MRmxSfzm2xPkxFIamvwN
	4lmD/18DfMFxlWb1mA7b0h15Vt/fuwDUoGMXbkpvt8TdQJEvm6OorFTluv6zl+jm
	TP4xTzqIrpt+RRq0cZ7bdmiS3YSpcROONCC+m4u+YFW+NixiGyiqlGw8u7vm3TU0
	9uHrSh1AMxdipsMmuO6Akrq4HfVM7imqrKwysGInSPBXp6i9dbxVg5eiOkzZyLMZ
	hbEJyAea5gb0upvUDUXzVcDujvVsq2hJflZ7kAnCDbOGBbSnLlCYWDPS7qLRpoCR
	tMl5ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesk0fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:59:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91574ad6871so885840385a.0
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781697572; x=1782302372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZ1B3IAw4oJQ2vLZXJ7tczm7eJQgSGAReWX6mfVUAoM=;
        b=CSyog5W63gL9Mvh1uewcAubpni6klVnyWlI4LPDlXHFgQTN45X85jcfKrTta88DzDf
         71xz2QbrCUpEtwTzBzgSbLrnt/VP5gXnSecZ+frL/zcbtrZGD6XfVESxNvRwAmZvFQiv
         mXDdMgXrRK02Yu3Wij4bopc0a5eAXskMneuxcln9fgB6BS9oyZkm3baRdow2ryW3rD6W
         zuft2TUSJ0mjKqsampp9RLzrjAN6ZA8+IhzBprlYT+/rZX3Vy5ZijGETCvK+621k8FdE
         9lXnu3q5sv8ZcFwcAfZXQFO2lxSc/xvamRzMYwoN6t6eEETvbp0w520FbDQuOTd2Hs4u
         1i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697572; x=1782302372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ1B3IAw4oJQ2vLZXJ7tczm7eJQgSGAReWX6mfVUAoM=;
        b=RCxXWJC+mZbdGiM6y9vPAYn6BGUfoYNeTk368s5OqZZqjDCsDmHa8Tj5j1jS8W72uM
         OAmnasfRJRvDXqpp8IsRw7uEBwWkMuXohB4VJh7QtADndV4PhCWz9L/dGTeYm/wIx8Mu
         m/OrexavDuN2MlPgw5Lc8tpLz80Z0N+jGr3Feo40VmBsU4dHWA93RwnhdK+AjcsLR4Gb
         FFJdxIbrOr8afrfBTUQLtCCN1HKLhpl0xq0dQdzaZsr1VClf0P5NxM87WxvIo9KcVz4a
         NRX+t/Ll/R6j1H2Do/tv8t6fh+yn0gyr4v1I4mf73VoupHPBMmYHTM1X1aJZPziOivYr
         vkyg==
X-Forwarded-Encrypted: i=1; AFNElJ/o7TObrlxzMUcHNRX6zzohMT6kpuDo28kHfLfPZtyukYA6+TYX1ixua8DzUsgnmr8TJXygVqS7/YgM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHm6GoAXEfiXnkvdb/QEtYwMYxuvR+gYENOqLlbZ6nSzv3Kay/
	hs8yr571gXdz4KH/It3pVAr8/gQmC8liYa8JLe9YxtSkqfXb13a010LpPX12LfAe+BUaBbHBNyF
	bvADQuobfI5Lux1nwWVtFsLkcSrbXvGx5SzD92+0D89+NBwGp5atX/jKRhvOLFunN
X-Gm-Gg: Acq92OFg+t1nLsDCWZ38aH5rS/M/2k6A4O/qeO7DC1tYLO/Zs/ENo4BPTtL2RP/vx/u
	2eIxWo2pH4U/IPVw72DOjQZ8S3ddkIndnnY9Bd5qqg/kb7sUS9BD/wW0rdcNFShoSjFxRfsaIWC
	5GfR1Hi+ZibGIo0UrSX7nD52LB0AaXenemJ7L+E4TJAASpRwnt1OhdAfeMdX7F0yVvFy0Bh7TbD
	l4/cpL3+zEI9v9+nhKBazEk/DGPfwJ9zJ+kY3YhtW2Lxf7ZyzkSJMgjoN2HNBit35Ukd397aSj+
	dsIUeHHKa/nIryuUptO0+n2xAEl1twy39gLki2synuFHj+iml22qHNmsCXiFapCJIlMWtbgjfXf
	UQafNfOqYJL5T3K1yXZwJ/XTOYRG9IE4PwmII3oAtrAcuwJjJZE3ywdZFonXEBw==
X-Received: by 2002:a05:620a:2907:b0:915:7f9e:a407 with SMTP id af79cd13be357-91d879a3ef8mr560665285a.0.1781697572377;
        Wed, 17 Jun 2026 04:59:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2907:b0:915:7f9e:a407 with SMTP id af79cd13be357-91d879a3ef8mr560660385a.0.1781697571741;
        Wed, 17 Jun 2026 04:59:31 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ebe3sm124137425e9.11.2026.06.17.04.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:59:31 -0700 (PDT)
Message-ID: <6b6651b2-cd06-482d-b075-79266874d2a6@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "drivers: convert sbd_duart.map_guard from
 atomic_t to refcount_t"
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
 <alpine.DEB.2.21.2605241628110.1450@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2605241628110.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfX3mBdnXvfW5fW
 gpNGGtEs9bNCjlChGV2lZ3Anwgs0wdxQs4azc6V5HmMKp7gnKztayrDKwWV7SLIdogx+KCuAYIB
 IM71WmddJEOT2mDoZ5Qij9CdGoNIrhJXjo6AiCPYk8xVJNr9K5X66tSaX8uYzXHo57wEcahvsNi
 rXMpo1a9jBP9A9K6GkvanlfumXVcDjjLWTX/nmsI/xg2PV4CDlR76vN2yuk7gBiGASFOUUugq0o
 r9WO1JjuV4xKXKRtIPXJh/IbXGi2crWRQkin7w9it6Ofqp70lMSY4arwus3bAcjqb8U5f6sqHVw
 CCZzLiJrDawohxzbPFNtZdntP2E71ok9kiCCHbUxGxhs1D7YuzbUGzW2lrOmS3US6H/EzNG1J5+
 kBx5ElqFDlJyrDSk4RndFsK0kGG6o0Flyhxd2Epjdl7XUyW8vYs9g02O4nw3khlydKogmCg6XGO
 cBGc8WfTZLa6DyYKXtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNCBTYWx0ZWRfX8/T5KVuVd4Vn
 TTW2KGvLDW2c3AOAlIF/lS7+GCv0M/o6nkuKCNwBG9+tyhVcxF267Y1q0/h6Br8uAFtjPvbFckv
 70+WJ+SJJ17QqREHBFVa7Fewkw8Z0oE=
X-Proofpoint-ORIG-GUID: J57rFDRzy0AbYh0JmJYD-25Fb7htzuT9
X-Proofpoint-GUID: J57rFDRzy0AbYh0JmJYD-25Fb7htzuT9
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a328c25 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=kD1aHXNoiUmW-fgF_RsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15120-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: F09C8699684

On 25/5/26 01:12, Maciej W. Rozycki wrote:
> Revert commit 22a33651a56f ("drivers: convert sbd_duart.map_guard from
> atomic_t to refcount_t"), which broke perfectly valid code:
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 1 PID: 1 at lib/refcount.c:114 sbd_request_port+0x54/0x140
>    refcount_t: increment on 0; use-after-free.
>    CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2+ #34
>    Stack : 0000000014001fe0 0000000000000000 ffffffff80830000 0000000000000000
>            ffffffff8127bc7a ffffffff8016fe08 ffffffff808d0000 ffffffff808d0000
>            ffffffff807aa828 ffffffff80822337 ffffffff808ce188 a8000001860b0000
>            0000000000000001 0000000000000001 00000000000001c8 ffffffff808a3090
>            00000000000000bb ffffffff801b09d4 a80000018609bb68 ffffffff801231cc
>            ffffffff812a0000 ffffffff80171388 0000000000001000 ffffffff807aa828
>            0000000000000001 0000000000000001 0000000000000000 0000000000000000
>            0000000000000000 a80000018609bab0 0000000000000000 ffffffff803c47cc
>            0000000000000000 0000000000000000 0000000000000000 0000000000000000
>            ffffffff807cb648 ffffffff8010bff8 0000000014001fe1 ffffffff803c47cc
>            ...
>    Call Trace:
>    [<ffffffff8010bff8>] show_stack+0x28/0x88
>    [<ffffffff803c47cc>] dump_stack+0x8c/0xc0
>    [<ffffffff801aff5c>] __warn+0xe0/0x114
>    [<ffffffff801233f0>] warn_slowpath_fmt+0x40/0x50
>    [<ffffffff80455bcc>] sbd_request_port+0x54/0x140
>    [<ffffffff804563a4>] sbd_config_port+0x2c/0x68
>    ---[ end trace f666d696412caa3e ]---
> 
> (report at the offending commit) -- sbd_request_port() is called twice
> per DUART instance, to reserve a resource holding the control register
> block shared between the two channels, so there's no slightest chance
> for an overflow.  Also this doesn't stop the driver from working and
> it's just the reservation that is missing as a result, i.e.:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 
> as from the offending change, vs:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 10060300-100603ff : sb1250-duart
> 
> beforehand, which is surely why the breakage has gone so long unnoticed.
> 
> "If it ain't broke, don't fix it," so just revert the broken commit.
> 
> Fixes: 22a33651a56f ("drivers: convert sbd_duart.map_guard from atomic_t to refcount_t")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> No change from v1 (4/4),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk/>.
> ---
>   drivers/tty/serial/sb1250-duart.c |   20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


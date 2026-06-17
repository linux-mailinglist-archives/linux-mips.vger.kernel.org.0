Return-Path: <linux-mips+bounces-15119-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdO2InCNMmry1wUAu9opvQ
	(envelope-from <linux-mips+bounces-15119-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:05:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B2699793
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 14:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FlhueFIq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ElA97vCe;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15119-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15119-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BF0130897BF
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 11:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6E53EFFA8;
	Wed, 17 Jun 2026 11:56:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F12368D42
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:56:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697396; cv=none; b=geH6aEThOWegJc5fbPqcNSBtc+LZDYRS7+PeGc2PKTiENjzGvweIFkR3PDCmBsC5+toD7fGZp/1wSvpP2AOm+adtDsVuYhxKjHEV/r852aCzMftJZWz0JNWEOJCXUJNDZ8UMoM+/1Oouf0a0EarX2NyFooQXc2fRPY1sj64qsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697396; c=relaxed/simple;
	bh=XlFMuI0tt1TzDCK08s/K5IKS2ZygzFZODioUk7NidTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHcytJV0D2Rme9hQ38znGJ67W47k/0/rmNcmN2es3SfcY7xla8dXwmnIqdr/w9MzO9cAoP8Z9S3NyAGIIn7et36QnfRiU9nv8qiLV9wWb+M67DRNhjKG4aGkv2p+Hve9t9VgpNTtQnppD+8XVz03Xh4xTZ31HfErtLXrMMBcSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlhueFIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElA97vCe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UTPc3273533
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3p8UZiQiYzgvHo8G5UaQP1hOS/PcyfF1lP3Eug0wko=; b=FlhueFIqYLtzq8Zj
	m97jXvggJttBsfT11thstLgAGmrD8ejPn4UQufDOFWizEZP28WT1Knfe22V/UK25
	ITd01OReoXRuwbnObrHTVl+UAN5bspy9PgyNnXVlkXNoxYSxVP8VsifU+7jNQMA4
	Z7/8xOGIMOseWMUP+H/4u+1eqwIlGnT87Cr8Yn4rbX1FZXXoBlD5W2hZql7NiBZ+
	LCGWBrb9BT5e6ERNtorPYKtQER8cUqjZZ+5UDyuJnMry4IpQ84k5/io1b+0oY6TE
	blNzrNICxkVH/1jxrhBSQvHLN0Q6DAtWko4tOupFt+7uPgZl/FpOE54TFFKWtqYe
	xes1uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtybk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 11:56:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91598af506cso562204885a.0
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2026 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781697394; x=1782302194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3p8UZiQiYzgvHo8G5UaQP1hOS/PcyfF1lP3Eug0wko=;
        b=ElA97vCeQT6jSZE/E/JcR7vONl1oirt/TF0V9GxIVMvSoGiuZLUZHPdRb52394BiJd
         wKX334765vsJdoEohp8ys1fZLuXIPMazjzXkKYLZ44Oo1lg6RxuuVIZ9dHol3bkErybr
         3db9Bc67IPtYGpgVpd+0s7ivnGzJ4hKjD8DL/HLCqGmH/3ybxWn4Ef6xKhHKZB5pBl2g
         SQIPJwZy1I4k2eu0o1o2NoHS5hGyQR/hDRh4OSx8wYfvN6zgI6YdzN+5KWNtfhAVkS+4
         mGUW5xerkbaDlMIKTj7iBTtPNZLGi4PUq67bAC5iJo+RMPF3P7SvMbMISzIJnlnM6FBM
         NDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697394; x=1782302194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3p8UZiQiYzgvHo8G5UaQP1hOS/PcyfF1lP3Eug0wko=;
        b=jAQig6S0tX6izydb85nTRzYpSpmnjFsXMkb5Won+F8tvJZ/x5P08KlH3mCVTLoGcSe
         0nzUJJTgb5hwlbHih5sWJaQgxQSJfWmPsuLU1wgNmn+WOrxvpdSHWlLp4Zd/LLTjTxVQ
         CY2XDySa0tl08anpzUxYX3qNwIeM+rSRpHucXCnhAuvj/PtI5IWdGwTJow1KPh3QHBP5
         zHknN0eU16LaS8upP3APsZrrSng0XFozikq6wSdl2uA6CApCx2bQCPbPepGItjfOtsZf
         /KQCB/rSUdjyd/i6TT8hWrfXMS7CAwGHDKfLYz5SQdle9Vd5/Ws/kF5vwYhgEu+FEH8Q
         Ik9w==
X-Forwarded-Encrypted: i=1; AFNElJ/K8LTz6Lno7RtcydVPgMm6FwA6zFSyv+DEeaBE6buqilbGAbTaWdKQANr15ZKty5rN6Zmi/DiVV+m+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70N8p6VE/Omk2SYd0DJBTBa8sncG0TjVfqz+xm49eEPnqSMTE
	h+6XkQQAodgzmjDEc5tJwucVcCE4v5dwSYS1mCZXqG1kdMqo1UwW26SLz/uTkomxYfq+UU1NJfC
	8kVe/bABCoX/c0rxYNVDqE1xzDo05n/UsYEJDieXFBzd3dHRdY3LeX7vpsJZUsrMR
X-Gm-Gg: Acq92OHyc/yCjTSRa01kLuuxv5SISVKUsF2UuHZJ1oUAsPFH6R/tgWFTQy+3/Z53tBE
	SzWgIkDiBEApnu2wRjmHAMU1YTQc3ZBZRVBDH4fniWfppeP/hDh9OVp5+DAuHIFoOhUCxXSBnqN
	dzXz2mZ20GnQ0zLPl+wotOnsBGgSPeTJjwCfg/wcnNhdmj6BNmjOmlPz2EyRGbp0H2o4FMOGLKb
	elupQgpezSKMX9mykDWHs+66wT1ko+AC1rE0Xuql9IgVP/9/fIO/3kDS2Qw7ALkwJm4J9JCGYO0
	vXVb0/nISc1fvGvzsHJ416ncnbcdjSQmggUp5tyQt/ylZtpITc2qBCuEIk1wLj46+QuWaW8ZB5v
	lP6yUd09zw0ck4DHCjOM8L1w2k1eYStnMsMWeeHAAVqc5aGv2d5vGIp2K8hcngg==
X-Received: by 2002:a05:620a:d8b:b0:8f0:f1a5:680c with SMTP id af79cd13be357-91d8ccb5ecemr635314685a.29.1781697393879;
        Wed, 17 Jun 2026 04:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:8f0:f1a5:680c with SMTP id af79cd13be357-91d8ccb5ecemr635310385a.29.1781697393384;
        Wed, 17 Jun 2026 04:56:33 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa3a4easm172487285e9.3.2026.06.17.04.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:56:32 -0700 (PDT)
Message-ID: <c8de9338-534b-49fc-a3f5-f135eb000900@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] serial: sb1250-duart: Fix bootconsole handover
 lockup
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
 <alpine.DEB.2.21.2605241623110.1450@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2605241623110.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q3Cm9DCS6Rp2jbCb94LjQk197IrtIdyj
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a328b72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=BcPKCTjPAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMyBTYWx0ZWRfX2ppOrEZcXuZq
 cd1xiJv571k+CavGxf+zpMI92219R1Jm3tCzFbIElNgOk3OgqBVNyzbcfH5oyrvfJAkkz62Zb+C
 VVZfyVp6J974SrUj3nwhWa3hiN/Mii4=
X-Proofpoint-ORIG-GUID: Q3Cm9DCS6Rp2jbCb94LjQk197IrtIdyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMyBTYWx0ZWRfX9VzFqQRYHekd
 8oGU+4e31uY2Xc9Kr9drbVthKG2U8UArqE7ra7A0/0/dQVmbgOgYelKdKfwmiRviKlVJfbqWLzw
 6ewSr0Rk3FSDVjrzq5bloF0vZN9+qY4iYljPBMCDNxDr7suEcXOiH8W4/6GdcRmIx+YDCIn6pXJ
 LeLPYNlT4t9BmZlLCR7QtNbcPWE1h+bSJJqKY34CwE+2zcdq20K/eKxG9jtqRTzjAgkv5QUDv3U
 rq+S72TOnDaGjW925qFYokjq0leawbdkR9YG2S55BdXRVmONM3kDEHTUUytkvw153ERh4ldF5AP
 +z1Hs36xQ4GMbfjocZ3DdeHv5lb56VUhPMO0jTScHmDDUoHMgOzdTcdj3S+KnbqY4GC3PuEfF+8
 kcrETAHNqU5Ruw68Qp6H5yCFu6lizZyTL0slBPfKmj+aeXOjHoxVOSvRL3ggU4HRrl3eLhRK6EK
 q/5xs+LvwDCM2D3P39Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15119-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,orcam.me.uk:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:elena.reshetova@intel.com,m:dwindsor@gmail.com,m:kees@kernel.org,m:ishkamiel@gmail.com,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8B4B2699793

On 25/5/26 01:12, Maciej W. Rozycki wrote:
> Calling sbd_init_port() in the course of setting up the serial device
> causes line parameters to be messed up and the transmitter disabled.
> We've been lucky in that no message is usually produced to the kernel
> log between this call and the later call to uart_set_options() in the
> course of console setup done by sbd_serial_console_init(), or the system
> would hang as the console output handler in CFE tried to access a port
> whose transmitter has been disabled and line parameters messed up.
> 
> It'll change with the next change to the driver, so fix sbd_init_port()
> such that line parameters are set for 115200n8 console operation as with
> the CFE firmware and the transmitter re-enabled after reset.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v6.5+
> ---
> Changes from v1 (2/4),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2604130338210.29980@angie.orcam.me.uk/>:
> 
> - Sanitise the change heading.
> ---
>   drivers/tty/serial/sb1250-duart.c |    7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


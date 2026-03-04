Return-Path: <linux-mips+bounces-13379-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA7sEmiCqGmYvAAAu9opvQ
	(envelope-from <linux-mips+bounces-13379-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 20:05:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC718206DC5
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 20:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90F6330985B9
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 18:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678793DA5BB;
	Wed,  4 Mar 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZZ8nL2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY4DiDF1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2549C3DA5A4
	for <linux-mips@vger.kernel.org>; Wed,  4 Mar 2026 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650739; cv=none; b=CGkWYj25fyce3Zp99iRLpc86Nt33BxyH79VzzFYcyPNjrLWlP1aYV6rrBISqW4WLPifdlvxIuhOYydE4OiYKhisDsUQYKcrf03cMFqfr9lacRRM1Ka8lSIXlCOOFzF9+C2/9VGJxIK7bJdqOdufOOE4u/p5W3X5fXyHdXzamTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650739; c=relaxed/simple;
	bh=zSn22tjdeIeOLGs64yWM2fNeD/NW/mW0XYa+8q48zQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uaPA7QGwGnzEUR1vLTsvA7VY6WwaYQSrEjvpL4UAQTuKxTRdd8vjzBmuW2/QKeWeiqHhyiWR+kzyoAMZyreZA0OiS9wZvLPaS/3mtyAqU1SaZBHjeY+adOnPyi9wIUy2v2Vl8yxDA2WqLZC8Ag28d94ojKVNKpYuhaWXF0TVaS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZZ8nL2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY4DiDF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DAQBD1421868
	for <linux-mips@vger.kernel.org>; Wed, 4 Mar 2026 18:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n29JUwbnURoI2InyjPVpCKRl1dJO4t33ZBTzppV/ZUU=; b=bZZ8nL2nMHv24pHz
	8eZY/lLJ8sa73YbhCqp70W7HXLustRoINTYMXqNY/zn4MlmRS7ncLshmTjle1vPs
	j0tXq/DnXwElnsS+1B9r4z02YEdiKgLetJoP8eyCCiWPyXG1V6VwsGLqWvxXF/AW
	vs8KBO4ahB6x3FxcCko8JuoGWd3ntyHgrCT2o19Bb1scx+kOqGYSbkbn28WYZ3Sm
	ZLQGgLhi6H2GEDL2XXsprP/WhhsgWIeXv7scAejyU7TGAEW3BOKLvyd7ywlUEO4F
	u46S789ArZsY6lQiID0cz+poGLZfD9P1hR8y9lzBTrYr8MChevk6k3dvvZFEFc/l
	G6Ljuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2kvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 04 Mar 2026 18:58:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so4358923085a.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Mar 2026 10:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772650736; x=1773255536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n29JUwbnURoI2InyjPVpCKRl1dJO4t33ZBTzppV/ZUU=;
        b=SY4DiDF1dmt15YRi4OADAMutHMwd3kibVgla3HOq8cN6pcpsTyNFGoZOoes4ZA9yQZ
         2/T6YhudNOxzy42oGI1OlVzNX1HCCy/+j/DGFcMoF6jUqa+cQY+M5GUcgR7rUsZrIdce
         Ilt4VEN5u2qdfzX3wWazkRzA7tq1azFTyWqLYYkKwjGNSRua6LmrElRrD1hxtkBp7WON
         kfBUBcsHO5mDHUXU8Ky6mGNpRVRUZ0fRXNYLl9/1W8O1vNcJ8mJbRisoCgh+bMnE0MCW
         t+nsomaSPTmOYtLjO1o7duwli7eTgnPKBgoAyIdrmLIE3WMjCWU2aNbHnO0sjjxBTWnx
         W24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650736; x=1773255536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n29JUwbnURoI2InyjPVpCKRl1dJO4t33ZBTzppV/ZUU=;
        b=nHoOKF1DdHrDSaoeCgIpOecjYJWf8p30+KqCXTw+szdKWftFXy+7ZLqEM8wRMgpoq1
         kOJp3cQmknYfrKvP2yKx/myZH0Yp5u4B62rCO3QPZRv0gNZ/QzphvAkfDGgkaezCzpMr
         su8fsFSJnhAuRCMAEyjGH68avQZHUF2PV2PqoCFR9sWC0/emT6xnm+LZoIumfZb9iwYJ
         11uV7GvFjQqzhSX8tccBxAcnXimMs80nPoZs0pdWoQFqiYVGdjglwNBWMRqhAy0naVJb
         jcLdOIea8acpfkHwb1h7fzzoc5XVtKdydpNWkCdXMITEg8cZRGK63rDHwbys4v/Nj+2v
         X3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7p4kjK0aWF80JoT4pXfBZEx4ca2tyABVDth7I8yZ6EijvwZwGb62ZQiOS6TJGRmWfot+ckqzMIQtf@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUgBnhEjf/CKD0dQ9N1ZQlMsmtIEe9vY5SrJ0D+D5VF+5p+NW
	W+R9gdkJF/wJyhltoyo+8GZzUcRSpU0W6gtj7AIokkpGikSFbSvRdvp+cHo5uh4vtSkXPChZZjG
	LDUYJKuGf1jTJOIQb4nPIilX/cQGYPJyFsnG/03g8LHPzNsTiwqC33Ej8DZNNJtthlyO0jwh+BX
	A=
X-Gm-Gg: ATEYQzyZC+qFfe/rzTl8zupt60FgTPPr+sVWOPU92ouBF03GVPwbsGGd66fs77HeXTt
	uiQ+4loqKzFKQW6v92zgmyWlvadpjeQAXIvJCtQLnFfl58Iyg0zk8xXSCEtHL0OXmJ0m6gJCWQY
	9488tZj/3fajOdeaEovKGYWXUilzbQm1bK3JchdoV00ZOcl26N6ORlXsYjzPwUruUqleLd1LsZh
	Koaq3iNfDxKwO1XXq/EjW/VILglj1cPZm1cx8KeRlHU5wTsf8BU9VMC2V0l348js3+MxEaBrzL4
	UyydHfupYKlB2POWHV97QzWZ84uyme2lXfzYYio/cgYtfFOgwTXCfLRlBU7PdBFatai+swcp5aq
	EpI6xWMao/He29G/lFBuY3m1ZCyo6v0XHVFKvWL+VfqyuS6fXBz3oAQ1qXuA2LbuJ8y0NGQ==
X-Received: by 2002:a05:620a:3195:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cd5af1a395mr386836785a.24.1772650736183;
        Wed, 04 Mar 2026 10:58:56 -0800 (PST)
X-Received: by 2002:a05:620a:3195:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cd5af1a395mr386833585a.24.1772650735662;
        Wed, 04 Mar 2026 10:58:55 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ee0b:246c:2dae:77b9? ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188923c2sm69730925e9.14.2026.03.04.10.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 10:58:55 -0800 (PST)
Message-ID: <b84dc28a-34ca-4243-a0ae-3b61db04fcd5@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 19:58:54 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/clocksource/mips-gic-timer.c:283 looks suspicious: ret !=
 clk
To: Philipp Matthias Hahn <phahn-oss@avm.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, linux-mips@vger.kernel.org
References: <aahwZ3iJVbo55int@mail-auth.avm.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aahwZ3iJVbo55int@mail-auth.avm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V3u-tPr28Ao2sjOe74I6chBryrfKeUO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NCBTYWx0ZWRfX8QpKv5thXvk+
 SkohhXbXe/vXElo6xulj300sunQebdYbJA7EWHMXTj2ggMf5FpqQbJmtPngUThXV7fMq8w05+XZ
 jWAZTuNj3rkUay1zqV1leW1uysovUn6uytVEF+E0UCobnDLPPPAO21m/ka/gzo7229oH+w3oLmU
 K2LoIYWNdG8ZSfYZkj7sfurbWEZnBLcm+55Nhk8USqvvXfxRRFI9DELvpeFiT+kYi+5emLm4ezZ
 FWJgq/XpN4Ngy19NawIbbL5B0F10mexcMJKpUw6fXRCNW+yE4lVWVlA2ue0005Vmumd4CO84elw
 9as0UgflgT7whxisaMVpXcb8e2cOqp7XArD9Zh0oeGWF0fBSeDeJ5KykTC/7FcIaxZuDxR7+9e5
 eZjHgysSeTufF+X5+7nIFi3uYvEx4xa/UA+Yej2SnUKzHZUNFjCM8VB9VoTlRJ6niQTBZ9vejcQ
 03coG8lS980bZRGDFxg==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a880f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=C8qH3MpB5dsiSMWhk_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: V3u-tPr28Ao2sjOe74I6chBryrfKeUO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040154
X-Rspamd-Queue-Id: BC718206DC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13379-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Philipp,

thanks for reporting a potential issue

Actually, the code seems correct.

AFAICT, there are two configurations with the clock. One is a dynamic 
clock connected with the clock framework which can change the frequency 
and the other is a static clock described in the device tree.

If the clk is managed by the clock framework the code subscribes to the 
clock notifier to get the information of the clock frequency change. So 
it is the condition (!IS_ERR(clk))

On 3/4/26 18:48, Philipp Matthias Hahn wrote:
> Hello,
> 
> while looking where IS_ERR(…) plus a manual NULL check can be converted
> to IS_ERR_OR_NULL(…) I stumbled by accident over
> gic_clocksource_of_init() line 283, where `IS_ERR(clk)` is used combined
> with `!ret`:
> 
> static int __init gic_clocksource_of_init(struct device_node *node)
> {
> 	struct clk *clk;
> 	int ret;
> 	…
> 	clk = of_clk_get(node, 0);
> 	if (!IS_ERR(clk)) {
> 		ret = clk_prepare_enable(clk);

Clock is managed by the clock framework -> (IS_ERR(clk) == false)

> 		if (ret < 0) {
> 			pr_err("Failed to enable clock\n");
> 			clk_put(clk);
> 			return ret;
> 		}
> 		gic_frequency = clk_get_rate(clk);
> 	} else {
> 		…

Clock is statically described in the DT -> (IS_ERR(clk) == true)

> 	}
> 	ret = gic_clockevent_init();
> 	if (!ret && !IS_ERR(clk)) {
> 	     ^^^            ^^^

Adding the missing line:

	if (clk_notifier_register(clk, &gic_clk_nb) < 0)

So the condition is 'the clockevent successfully registered' and 'the 
clock is managed by the clock framework, IOW frequency can change'
	--> register a notifier callback to track the freq changes

> 
> If this right or should with be changed to
> 	if (!ret && !IS_ERR(ret)) {
> or even better
> 	if (!IS_ERR_OR_NULL(ret)) {
> 
> Philipp Hahn



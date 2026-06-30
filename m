Return-Path: <linux-mips+bounces-15374-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j/ulBlU/RGpurQoAu9opvQ
	(envelope-from <linux-mips+bounces-15374-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 00:12:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4856E857C
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 00:12:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UVVUyqEg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kEAAEWd8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15374-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15374-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3DA3312094A
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 22:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB66331F997;
	Tue, 30 Jun 2026 22:10:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50C320CD1
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857404; cv=none; b=emrrkepDwa79lrwWfaq32dNFn5rNEEqfnd9Ie6EKBWjwgeDnom36VIm9ZjNh4YuebOUSPsOYrlqL4lgueZZg2bu12JqH/zK9SOVk7TFrOafPe3QTMnwOOiHJm/AmUrj7723oELtxCPB7TKNdolZ6LZAs1nC73piJdAjavDHSYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857404; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GU+yUJWdNAQXgTPA8TVHwXY2p6UgCzq/xtLcf78FRzkqq2MRx83MSiz2GtNHSBU/9/Y2g6sZm1PGGf8RtBim0bU5aB7Fj63NGw22lShwo6H8oi4SEchSIMY+IM8OwCiE+LjlTl8H5O5hYpKwLrjDhkbv5GNviFwa1Ga6gGWCe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEAAEWd8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDdZK2948578
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0qnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91ed0e140c5so3512485a.0
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857398; x=1783462198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=kEAAEWd85ty1iW7Ehg228b7WvVI2ivezDIzTJZHDcsJExAZFfE54uIJMN3ukrEJNaP
         IzRsRUt9woJFG+L9jC/IxUJPejgZTiUdX4JRrF4r6z+WCb00ywdszUM0o1rOhC+4vm1+
         XN1nHumOS2/QSeUZDl6jRd+VMogWYL+N0ADqzShbkSlegScjNLEYy++Yv0v7OawbzDiU
         V3vfxWvQwZDDffvGKjiRasDsIpzjeFL72OVaBDsRHsgSP1QIkpCv6jLTDuFZPr9zwoKP
         M7b7kfvHJ1ufBP9BsbKztO7Tszouxan8SSmgXnQqqqhVeB4iHyfvRyQb6j9U9PVoEkYG
         pvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857398; x=1783462198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=I2PTuif3vAO9LeSobV9VhU0Zl0ImHSrFY+I6FcVzIwv1KMXqFMjUuqyuR7U9avX54G
         fitxTUMI9LJly4BvMVLBJ36KBhJsVRxvPqqNYla4gF9WErNHhk9otKkJQIOamTJb1Nbo
         y2aCGox5u0SY7i19cSiZoSbNzMynOM1FzATt0mFC0Y2lwq0euSrZ4ZP9uIiOdEEmwIgU
         6NRWkrpiUnm9G8ba7txAljJmcToHY2aQ5d06l/vL4OthMFBnHrWfRAdVzpUqGCNmiJtC
         hyGbzEnV/8TA3eDT7QU32l0SCZv4Jy2J+ygIfFWBDTqISFhWb36IK+pbV0dYHt3gxj9h
         0uOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I4QMJvlP0/Uj3lo+SPP/feJM5XgLk5r1uwqbZVHImefJTa6IR/1kCtWHSpyzWH/iNBkPArwv47scI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1UnG2PBHfS4DRIb5eAeJEDEdRxVKhNSJ7TPqGt+hzpIy04Nea
	WCZCkjamIEg+GEfIzpHdEXt4qzXTtCpWEYGaO//bhR97craZi8XXA7aF288HxI3lGZSi5OdwIPz
	hwKUdZwtwjf5pTZBo4X60EmzFfjBQBEY6oG13T/j8GvzL4LIc6F8hqA7f0tI3W1vU
X-Gm-Gg: AfdE7clmbq03PJksACty6tJ6T0QiGxA1W0S8wTnuyYLHQltXFvbcqXFTAlEqA+IweAL
	ZqHcuJptHis7opl6snOFoK/kVymbHZhx/bb3cA3QinHNMQsBdhL7+VqWOpak92RvpF05UBD/IWA
	KgToFJVzrpJseV06JfvMrm9Tbd5T793V2IAmQ/o+/PIxLijy1qXUtdc0vjfgO2hf3j1YHJVLPGS
	IfyXB4A7f3Ur00EqILZ991qGmLKbpq9y6TEYz+0+BZWgGcDju4t2FOSbUSt5USxL0xL101duJk1
	kdBQmoOGVFzTHEpGaaaZo1AW+15u2hgUlHiVXRZDHZbTeTVR7CKsn3d3XjDNUNLmKJt0zImmVsN
	DWe5oF79durVAFkJ2dJdN0V8cXXTwwA3LqB16SBoZXXbXyeV7L8JNEf/XILTbag==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434253585a.66.1782857398247;
        Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a443eb7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fHrEIRQPT9TYadOVlq0UoprUXy8MaV0D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXyZjuZvQTtTDT
 Ed9jmiXawcICtRA74usxcrwuG9GsewMUSIVDBuvVlumvk+aNzX13o0l5N7isQ9OXw2As/Ak0puv
 lEHrwkzd4zk6UQhIDT35z+v/zC3naIg=
X-Proofpoint-GUID: fHrEIRQPT9TYadOVlq0UoprUXy8MaV0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX22TABH59LHa/
 +5ygTe9HtzSUh9YYjNFyvgDPHFNVrkrn0qykMmEgWembfl2xa6mQWMITd6qOkH3YTtkJMqruxxE
 f+zxHcbgAQEgpfg551wXmhF7v/uBp4l1bdOGHZZ4vUTYo0VMVAXC8uW4LO8gehR9jIdlBYnkTxb
 YnXB34ttag0CmhPXhB18seblM8U5Bd/O+nM07ZrG0Evi5QS6wuixOzByo4oHO/yPLkqeFLWS7/x
 F2MfGQWvA9Yl/A33sIyZHvzPkYExV65dpGemlpomA6wIJ27hjk1Jwj1JYWM6uNGRfLnZ7K8AeqM
 +sIko1GOqCLQJ9Cahwjw/d7whxIYbGcHsYX1Am4FsvJWONy1kkv19XlTBGhh2fst071dyLMNurb
 fxccmJIOmgqQZTb5Ly+vo9IUDBDtLI08ZbDeCOadLBLXgXTDfHyblY5WDkS0JjsLvGdIPeRSLwJ
 nsGGEEM3FQrRvXGyeKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-15374-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,arndb.de:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE4856E857C

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


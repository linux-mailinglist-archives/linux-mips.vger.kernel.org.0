Return-Path: <linux-mips+bounces-15373-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SHSFHq0+RGoUrQoAu9opvQ
	(envelope-from <linux-mips+bounces-15373-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 00:09:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9386E8520
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 00:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YjdrKYpV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EaDRdcoP;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15373-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15373-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0E513064447
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 22:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9733264F5;
	Tue, 30 Jun 2026 22:08:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B52673AA
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857331; cv=none; b=IYF+L74Wcz/VVogFnoadlZw3yxBBekPxKfhrXb0AJ4CiwjdVgiZh90HoSBnhRFmaY8IqM8mnSLGZtd2RUPao0q6nkk2MxXuqwZ0gyEvoxYLIJoja/N1AWdW/M9bKNDUazgHr4hQfWcS67/+yTg6PyAVJGXTqZYDKcZJIPtLImQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857331; c=relaxed/simple;
	bh=eyMPhz4D72N34DaHLBk8TtAHe/1rzGfpY/U34NdyrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTjLUdLxJZ/HP2xGcAr2ciOjth86L2UfM2b+3vcdlsqpiwUDseO10I60QOh9/+TfcXHuzDTiVvDq/pYFBYqphQqFUo1sSBeKhF5Qxm7pCNvD6TjmljrPneerH0mGy0qJjdkrAy//mw62ZbmlEYIQNr/Ipum6gkspC0PSQfpPnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjdrKYpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaDRdcoP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDXLi2948414
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0qhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso255056d6.3
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=EaDRdcoPceYoAWWUwIABiowKA4xewzdMc0gWkmN5YI4B5fvUgR0r97ljpcBh7pYPum
         Iu9t6cIR/v6ZyzFFS+67GAP99hO3p9A8cR5pDpNEx/BaqSEtfVfaLGdXSaGKYNiN/YR9
         7JtpB/Rw3BQinIvKbYVHwtjr7VMPL3pYrzc+BlzcGrbjuD45LolyizX/ssLCjCOfdCFO
         21fDXXr1D8DW5xVOBg3DGONiiZxODGhEBgGmB9ZZKoj7DFKhN0Y8W9nwQhEWAXhyUWca
         pPphpA+1fknebnZUlAdDkznvkTfjuXH6gej05AM++BuzPNFZ8dUStE0eu88NiOVHJosH
         3g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=pXFdge9zCZdrKJqcJy4m/NffcyetVenUtUB1rPhzbPV+E9mHnplfG3m3NW86GPAygT
         VIsQZ/odvSTtuzdkj67PmYh/nuD1PEX1q0KBKFaIwe7VxF8Si4l5xum4mJcK5XGP9wDm
         4+Hcov9ZBP8v93OoGhZUbyaRwwkOwZfpsGox0F0WUEL7V4U79MsKKn80tIHW7dC8MBNO
         zBOD4cZJHUoPARONi1yY0izwUDHQzKElIKrw5cv5wOaFvLc+j1/DdMqyLdz/h4G1HV7t
         3xJCzc6esmmUDXX2tH7twR+Y7Kf7YKoMqGaZSlAvpNz2XyftC/QFAyaPT/U8ozcJUt5t
         ImRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j/ZvPYUSlpO7gQ+oCSmkdRZzR/kZoR/K/2RscJt9sQx/M66/r2GHJRIhTnzHjOoqzt3UxpgWK7Kb+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fl4Gs/V5HYjRHT21ae7b30FENtFH/Ra5nIorjM4Rhv34+qep
	ieGWBmJw0TueYbcQuy0P0WSHXSw5Z1r4Hq993Vsp935OFyjI4gB8VK2+JhLoewjtMIdlBAN6WF0
	2X7tA7VI2+ZD2n9QaE9AyX4SzX2CekM+ZSUx/cKP/QWCJbvBtZ/RqBQVq1m9CdWOM
X-Gm-Gg: AfdE7cn7OyKJewqdThQkjB++QPWiDjV9G5wEa7qpYaHNQ2pQdEa2x24AnM5Iy3Oq6A8
	R6xYhq2T7FXJxPgA10rdl8XbhuQO7N9SDjXfpq53eGn7MkYOH9IAjH57QYhXBIW5hC3uhfJzfhA
	7NMX6SZ6QCSxiZ0Ms8b0KpUxsw7o1DjU4W757YEbzQJQaU8V/zRYCnoC2q2eA0r02MVucZGpEjf
	G8COJNoy904cu5b5hQLIKET0WZprI0OyyFlH4yg0RF/4tj5MtAF/YzLxmE8d5Kc8p2Q9dgz6SmY
	sTCqH/2idx4LjNA5tMGs2xtWmB92HBUoN5TlShpafVz3FfhTIDuWfpyK0EOZB7sBR97c1je22jX
	VqOoouyIE1iq6ti1AaWNKSR1xAVPDaaTd5lMSYCeL3NafGa3PqXlZnDuigM3LGg==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404385685a.15.1782857328340;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KPsPA-mOJIEDBiGzlWFCg7tYJ6jQEHQ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX086jO12ym73D
 z7d2aZZZdMQICP+5b9wIDqAZFmh5Jjpdm365ACJdtzUTpLW2p25mKAnGmQpwlJu6v32T/zI7wrm
 WMWZ8GvrZbnCCF+CiTPZ4KP2ux95ou0=
X-Proofpoint-GUID: KPsPA-mOJIEDBiGzlWFCg7tYJ6jQEHQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX9hEnz0vx0mj2
 IDKRlkY9mr1iDRIVFKqy2iGmxBuMHyWKmXHI6AfChRD9PSapwMGSM8oEu3RlK/mRjrloz0wtgqD
 uCl2ueAzDOXHPmMmNhqimXNn73hFZ9m2lhkHsOBLPfdc7LNTXPAiBJgQ95e5BVSp7G1z+ICpylA
 hvGOwYLYNZJKF3DSvbQYoF0CWTtYFDn5Ejxg7j4nRQWZfGKM7S6IiUeQKsF7s5Z92vS7bT5m43X
 1r73mthwiYeHDaYPaplN7PCje4Gg6mq/2CH9x8voilsrce46L+DVJmdCaxt+Bjp4pFx2iX+h/ng
 YCWA2AN0iv8DwGLgCMeNyStiMjttPNpsWq7YqoIZEOodiokMUnqqCsY/pPk9LWc9/QZ5W8f+EfN
 J4pE6OvGMpNVbG+uHNQvJ/sTr3TzostWXSphGjPE0iRP00PITopsHBoRQ4HMT/bbMQpOnAOcBG/
 KFUrCRA5vuSEnKsJxTw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-15373-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arndb.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: BD9386E8520

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Return-Path: <linux-mips+bounces-11225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7293B523E6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 23:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EFD05620DF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 21:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65533112AB;
	Wed, 10 Sep 2025 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+lVxidn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA6E3101A2
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541377; cv=none; b=m6teaErQBKa0wmGEAHGWCq0j75zOrZm3Co692N75AMDzsQea6aT357z1ywV5NCYKCTw+nb7QMffFniiHp33IR/PETQ3at7Z27DnOpIF166kluy/bplAMo0qqyJyJVt3sMLvgSKyjhM+f6008zvaquBuDMjQNNnAAurKUnQgFWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541377; c=relaxed/simple;
	bh=1K0L7vy0m6oAWABtFjIMxHjGZLkeAdVFiL8lxzfzoUc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B4NoZ0TyNiqvK/X4TtAHKgJL/yr9CrufJ/FpMTRu3CeIa54moSE4LxO+2rTMc4y+AUklb1QpwSKSR+atdSwTH0iK7EmnAz2nRdaKEBBs5V32kS8I1k3Hq+ePGmImUgtdcGXsCPZseFDid7b1gwhB86wTAZho8/0orga5fFU5sTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+lVxidn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso83113a12.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757541373; x=1758146173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=b+lVxidnV+8U0kRBo9XFjy4fq9sWGM/85Iru9AQR6vmi353pV/OUyC4YhQcxqhAEXz
         1k3RY9B9dwNUkio/BpjrLqBl8MpPirM/BEJd/6B64vf6Qp//pJ66hPdIjRxTB59FA8qe
         mIr62K2Rp+NVV6LRYvBt/MxzBxA5GfhRpv+urZuLKlJpnAiliZqbiVZ4tp8kerbaw3gx
         fJhKoSg1xjq1ergfMYvhdyamD7cSNTtKvZE/TryF/ZkWIAYYIHBayW4w7uMskUohi104
         CHmNCBlP7cie8QN8jNa4wlssLoJB/bWxXfQ3tsfftqnXCcdIRmMDeqaCQrUGtaBkG6yq
         KG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541373; x=1758146173;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=Xu370pzz1Hb+QE0aW8+k+bpTJGImFIw0HoKpfOkiU+WWKOXTqSMkkBPJoJwSlBNpVo
         TW5mF9GmuzCeSN754JlWyC86h35U8M4WwAJF23ltChO36oSp9wE2ul15rL2aDhDGNhNp
         g7jIlgbMtQTQFhXx5hz2ygt+qGcliGySNQyoUiPCbIoanePmsuD7IeR5tdH1G/DvDVPU
         tJxIxaetwXtKO37pVYTQ7QEKeRYFpmllRaLMgSGcljGfsmZqWqC94G+8ACeoxv2NoJpE
         1GW47+VyK4FycsswiLkZzo9eg3hGjxDoAgZRFmgQT6TaBzd8drki/R2nJ+tt6VFCniIu
         lBTw==
X-Forwarded-Encrypted: i=1; AJvYcCW1uyOrTYjfWNR7vPvd56OZAIaWIOql4l8BkL4xUOln12z9ThtlMZWaoQu/94rjTTBjYyR/dzxPoMcL@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfJiG6Iai1Nxt6zMEe91fUyUIHPsQuOmP+msN9eOGJSzKg+C3
	QvCrcLitumGgPM8uj2X597Yg2KMhrEfhNeABHeZufZqsWVWDEBqhBZjv
X-Gm-Gg: ASbGncsahmuhee2dj6bUVzWQI2i+ED+G6qWPD37K50U6K03YEyBVaqHw3MdRWL8YvQ2
	lKDViW17upkdoeZ5pOmVaZP5sdqKXdvZDa1/dKssuWguASjHgkanBzLPZ3EcdH2wnnwjq1e3FaT
	TuqaIDyJQOxlvSSXkyEf5hqjZefgX4ghDZmIF/AkSFLMTagueqkChFykJwfbmHOLvKoq1L82lYg
	22j4XAD3Pw42OhSCpCd93eNwy2idtN9FkCIZOSFwYckcDj5B2DHSFcR4rIV+BrbICtJXj30V31V
	reUGJXqQ+rLte6MroygMHuguDbBd8o6EPhH9eKuFqotyBbZEfhMAMDTCWvJfOcwrqOOQenUPxPo
	uiNczo/5/BeWTST+UYNE0eKGFSECqczTRXJig76Ta7Fo0tU2Q3a2S87AXTa9o1U00y33RYKoAsp
	mpTBaTuHk=
X-Google-Smtp-Source: AGHT+IGBsR+U1n4WFqO8g+vB4ERFu4ybrDNCTovC+1KY6W1/R7uSZEcXa89aKrlY6FwBWGiHJP9Ndw==
X-Received: by 2002:a05:6402:50d2:b0:629:c417:ee5c with SMTP id 4fb4d7f45d1cf-629c417f146mr10662130a12.32.1757541373118;
        Wed, 10 Sep 2025 14:56:13 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ebfe0ac03sm69476a12.16.2025.09.10.14.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 14:56:12 -0700 (PDT)
Message-ID: <1206e86e-488c-4c58-9e67-2313a678a5a0@gmail.com>
Date: Wed, 10 Sep 2025 23:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: richard@nod.at
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 dave@sr71.net, david@redhat.com, geert+renesas@glider.be, heiko@sntech.de,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 rppt@kernel.org, sergio.paracuellos@gmail.com, surenb@google.com,
 vbabka@suse.cz, willy@infradead.org
References: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> In the past I saw that programs such as the Java Runtime (JRE) ran
> into address space limitations due to a 2G/2G split on embedded
> systems. Reverting to a 3G/1G split fixed the problems.
Believe you guys are talking specifically ARM so FWIW, but I remember 
for x86 that at least initially Wine and things such as VMware were 
affected by the more creative PAGE_OFFSET choices.

Both will have been as a matter of plain bugs and are supposedly long 
fixed (and I in fact believe I recall such fixing for VMware). Never had 
or as far as I recall heard of other issues back then.

Rene.


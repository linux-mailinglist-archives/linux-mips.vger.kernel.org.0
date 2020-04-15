Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A8D1AA26B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898276AbgDOMyj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370628AbgDOMyZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:54:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4137FC061A41
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 05:54:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r26so18939247wmh.0
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gMusnBiq0kgTDrpsrPDkgFe/p/9TlpUBGWfRPHTqHeY=;
        b=gHiMFG6JrTjZo9dkSdah4baL1TKY6zn8dgqqjhx9KlClWT65Kta6zhWHlcNm7Q9N2/
         AjW2VSTjJtR26Jb9jbjMCcXyTFqlPmicw9xIKD/GX6XIOGOkchdhS4pl3rH+vg5s4gw5
         AYq6Y8XKrfaSAK4bYNekAHsbIO65aLIiWZA76sSA7kf4A+1ABc9e4y63ObGstHMjiAP4
         OHHwoq5r4qBtEe5ttjDUKYre1VfXxAFIBPoJ1t6tljCaRVyBt/sVxsbjuoPs+b03IGPR
         vCk7S/Df1FerRG27MEQ3YFhFF+fpnbiajjvheTSLGCKPjqraV9VLiu8TuCrXrUyO0OaZ
         fgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gMusnBiq0kgTDrpsrPDkgFe/p/9TlpUBGWfRPHTqHeY=;
        b=Q63NXXturGicTNMFw59sLiO2UKRdgkPSppNbLrLRnWepmO307n+p08mUrtF/T83TkC
         /HCuW3JCuN1omPquRxjJJK6WH5BQlg2mil8/d9d8CuwQeLNnbWDSkFhgCpiEMHP8ONuI
         AhYKfak7hZ6gN71h1LMxvOh9CFGRu/uvCRGg8xGFuH6Qmnli+xeYJpja4jm3aAdImY2h
         IhE351okh/62qunF/c1V6N19Fg3nKV+4JpDQGmM1R0QZyreVCBbNUphvWrSirn9Ukd0C
         KYt92nI94C7KkXH39+ux3Lv4pebZiVimMbBhdlKVkHdwBIW47Gs1uLCabMktjb0/08S+
         byJg==
X-Gm-Message-State: AGi0Pua7Px4s6p2uZH84Oxh56uIeEK0h2ifVfqPH2+TDKUSajRbPfuzs
        NH13/w0Br/2ckiUDiUImeR8Zyw==
X-Google-Smtp-Source: APiQypLMKBGPhfHLyqMorjw7AJr8PA6vGRu8xG+UF78Eg7uanluyeFylavuUVqpQLJKBeGIwXi+r6w==
X-Received: by 2002:a1c:4956:: with SMTP id w83mr4958282wma.43.1586955263636;
        Wed, 15 Apr 2020 05:54:23 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56? ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id x18sm21955582wmi.29.2020.04.15.05.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 05:54:22 -0700 (PDT)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Vetter <daniel@ffwll.ch>, kernel@pyra-handheld.com
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
Date:   Wed, 15 Apr 2020 14:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 15/04/2020 14:43, H. Nikolaus Schaller wrote:
> 
>> Am 15.04.2020 um 12:12 schrieb Maxime Ripard <maxime@cerno.tech>:
>>
>> Hi,
>>
>> On Wed, Apr 15, 2020 at 10:35:08AM +0200, H. Nikolaus Schaller wrote:
>>> The Imagination PVR/SGX GPU is part of several SoC from
>>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>>> Allwinner A83 and others.
>>>
>>> With this binding, we describe how the SGX processor is
>>> interfaced to the SoC (registers, interrupt etc.).
>>>
>>> In most cases, Clock, Reset and power management is handled
>>> by a parent node or elsewhere (e.g. code in the driver).
>>
>> Wouldn't the "code in the driver" still require the clock / reset /
>> power domain to be set in the DT?
> 
> Well, some SoC seem to use existing clocks and have no reset.
> Or, although not recommended, they may have the io-address range
> hard-coded.

The possible clocks and resets should be added, even if optional.

Please look at the arm utgard, midgard and bifrost bindings.

Neil

> 
> BR,
> Nikolaus
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


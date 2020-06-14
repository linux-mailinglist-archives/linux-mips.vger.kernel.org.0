Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9211F86C9
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgFNEpv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEpu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:45:50 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2FEC03E96F;
        Sat, 13 Jun 2020 21:45:48 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j6so2190409pgh.4;
        Sat, 13 Jun 2020 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8gg5QrEU9y9uK+DCdRmHTpO7zkuXv8INfFU0qv5ZbRM=;
        b=F1+EobDt1ICx3L43YXBaY/S+xi8hVpPb9gvHaLRnJeHlzyb2VV2FMGO/hXLQtZ0bqc
         SlakszzsYNHaBmEitVc3aeqZ1tn3f7BHQ4kZCkPdspoSqq3+UjIV19M0Pq5/jPEVPg8q
         fhO4NREKt/QTo+98AwAPb+WX6BsIVy7lP2fDH8h5uFbXGA9cyBDhVgHSCv0zh/Q0JDxo
         bYdvTDJyztbGFJ4sAm/7laMuIj/SCC083/+ELhtdXdAn5PTdzfK9puNS1g++/2ACSjjj
         m5LApDKS/3jGaLumbmr+ZMBdqa1Ibj0nN3nBRV1sje5rKTJlCZHAeD7xPGpcVSnm59zs
         Xm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8gg5QrEU9y9uK+DCdRmHTpO7zkuXv8INfFU0qv5ZbRM=;
        b=HGWKnyorCsHAetCOV547Z0/EJFYZ+QAdgVsQGHp8XQjMAZJv0XkambFBTdnQMsOx3g
         oGIdG1Fp0i37S33p/hXZ7dUlCthrQBufmJkzMfExid8uOGtcpPQSNiaNsPYhfEqg0STM
         Lq77eBk2whC5tmbWcTnhomwUpORJ/uJV0nbAuQ6z1XpYjuRdxYAjLnyYBWjKgWxRq/uI
         mOpZj58fy9tOT7/7Vm0nQgj+srQWFvsNr+LNq7ShTD3VBEljYXAOAI1MdxL4Y+Q2vVJp
         dyJrYvMuao8E9FdsBePkABS46TIC79LbE50d9Gwb1pp+ROB3vH6UWOC9/c3ygWHWiXcQ
         Wk6w==
X-Gm-Message-State: AOAM532EQf4W3tYwBfN3HgvZZ/7I2lZg3T0KZN0yAVzcGTY0q2zIDW9S
        3U8asPCwGd4dWTUGqIZSUNE=
X-Google-Smtp-Source: ABdhPJzFP1BfCPGNEI7WxZci4ng51jhzqngxgUZKePXhK65118G4PfQSBVZX+xAlSFpKL4ppSfK3wg==
X-Received: by 2002:a62:2942:: with SMTP id p63mr19181359pfp.56.1592109946808;
        Sat, 13 Jun 2020 21:45:46 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id h3sm9644528pje.28.2020.06.13.21.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:45:45 -0700 (PDT)
Subject: Re: [PATCH v4 2/9] mips: bmips: add BCM6328 power domain definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <97cadafb-1b83-3d9e-a9f5-fd15a228febd@gmail.com>
Date:   Sat, 13 Jun 2020 21:45:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613082140.2009461-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:21 AM, Álvaro Fernández Rojas wrote:
> BCM6328 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
-- 
Florian

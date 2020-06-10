Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFBF1F4ABB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgFJBM2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgFJBMX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:12:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7582FC05BD1E;
        Tue,  9 Jun 2020 18:12:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p21so201774pgm.13;
        Tue, 09 Jun 2020 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=MqJjdKei4BqUxxWSzNOOcjTAtDFpaAnGp1PKq1aUZgE=;
        b=Lqu4zmHYBn3Tyq8LuoPSLUYoRwuJugO52dN8ZEJ+P54WIG9oEPCqjHeutHQbjyO9jG
         5WpTtpUBsaU9YBGxLueJFRm2rGRs5Ksj6NLRMl/8ZxLrAOO8Dgxdb2hse6f8rjtkfoA8
         ca2DL+vmyaZk2is4E6e9PwCCqzeyFCcUfqhgTm+Xy41KbEqqpX/Yry5RkDDZtqHnlLR4
         bmVEXtB6y/H6+R766nwtGje3kuAhghFxGxdSp0juxgtzGL+1pc0SF1X54BSGwt5Hu0BJ
         KdiOvzXkQ7DrGGAqxYGlgzFRym9oS59aPCz7chVt+lEE6Plhm8zrqcO86OOIJDIqWqxb
         oM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MqJjdKei4BqUxxWSzNOOcjTAtDFpaAnGp1PKq1aUZgE=;
        b=CL76pZa4p4A6IcpjXilPdYHKrDAXcW5RjdeF9mQL3/+2t0dpGgWH1KIwpoeigBSuGu
         /pGH/ETOXcO8n6CcYE3E2pcTbztTXGnUQtjqZrcFR84yxSkY85Oa/BGVoK5h/IkW6+hR
         QbP3OdzM7DABzSxltpp+gept31WkUEO3hMYCIhVLUOXWcXSvcYU3K36kB0BuUmgSl68z
         c0VrtRcqB13yaRJcUw95gGaalEBnwZUt3FyJyHZiP2gMeKU9dKOgyEcjAlrsjob2eiv/
         B2QBuFOWrXJj//3nU7Li83D52Xz+fWMAw5Kqa80tJuCJ5n67HR7+g4wxUR7B6WcRrA5b
         9Vsw==
X-Gm-Message-State: AOAM531uG3+MZgRRZ09Ffc/hq/gjyPA4lBwl4GpkIuc5c916M3Tns7dt
        bwtCBOBnV5c7ys2ro3UNoQE=
X-Google-Smtp-Source: ABdhPJzinC8euQD8NFr+jgaQ+nGRBexC6jaF1rTAOGjr0cX59OUmSYfAu7TOiP54MCNY/Xf93OPWvA==
X-Received: by 2002:a62:1a87:: with SMTP id a129mr483796pfa.95.1591751541968;
        Tue, 09 Jun 2020 18:12:21 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 71sm11153202pfb.20.2020.06.09.18.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:12:21 -0700 (PDT)
Subject: Re: [PATCH 3/4] mips: bmips: dts: add BCM6328 power domain support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200609105244.4014823-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c63d03d6-77bf-04bf-99c0-953da7197a3f@gmail.com>
Date:   Tue, 9 Jun 2020 18:12:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609105244.4014823-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 3:52 AM, Álvaro Fernández Rojas wrote:
> BCM6328 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6550C1F8719
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgFNEwI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:52:08 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D71C03E96F;
        Sat, 13 Jun 2020 21:52:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b5so6314639pfp.9;
        Sat, 13 Jun 2020 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=pwEq6EWpgufif9QPiano6bX2JLu9B/b2fY6JCl1CvF0=;
        b=EA8ZJ/30lYzSM+O5Ao9/Ja09w1VYKLmQC6IgIxCv1GcHgzq0f7zYIFeiYGte+tvZpj
         m8phLFt4LhYvOerJ0AEAz4uG1ZMO3Fp6Ljo8RTNAb5+S8u3GrJSfSDWnqNDErS+RBn6Q
         EsSXqIGflYh7WkNRHLjlzB5No7BDJlYyBdRQMjUa+aZlxh0Nhkpjv6xOBlDlUQoB4LRo
         L8Oa9KCpF7MRnAA4M2HIwFugVC1kfvp8495tVmDmkn46x7BXBC1y0pe/3/apXmUv2Eff
         vXaZWTvcwbngVvktvneqElaD5G01ylxSIVXwJeNfY5nxoxo0ESGyA+/U85npSUYr7WHQ
         cYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pwEq6EWpgufif9QPiano6bX2JLu9B/b2fY6JCl1CvF0=;
        b=RZcC/gii/iqtmcuqvozo8CRH6gdq7wZy3JMOOIwQ878EoAA3MyEhgbe6ljOa3Zdvmu
         VJU/t0cOantMq4QJ6f7D5sP0kIU5PtRACkL/sqMvmH+bsuatZf+x2+lkH7G3Y+wrYjdf
         q091UBA/S+7pBbbMWq+qUr7x0vat9+wpCtfOMrVolpwKwbeZKOVvrbjj3XgUTEVCO4ap
         K/zj7D8gg9NMrwu9Exlt+hiV4P/RhWXBET13pzL4ptitawYvDGWBoUOcyOVlt3K0X4Kj
         tQfmmHkwTVJT7tXmgRnix7HXCcp6tnJ4JHEZyfXF3kJoZDshaqB7Fw35qFO+1X2topji
         4I+w==
X-Gm-Message-State: AOAM532wk390aQ7ms5XhD2kLluotv8/bsq3/Afliq8glauE7UaruWvLk
        oCIugc1XhlK+/qCBKO8fim0=
X-Google-Smtp-Source: ABdhPJxrPp5ZsndlHOswB03R3pfo+8b7pocnbx3Qc8nk69x8SYVX2vrDmgvUm/wJKjOzz5g+xLTfNw==
X-Received: by 2002:a62:2d0:: with SMTP id 199mr12416482pfc.4.1592110327089;
        Sat, 13 Jun 2020 21:52:07 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id r20sm10726402pfc.101.2020.06.13.21.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:52:06 -0700 (PDT)
Subject: Re: [PATCH v4 3/9] reset: add BCM6345 reset controller driver
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20200610172859.466334-1-noltari@gmail.com>
 <20200613083813.2027186-1-noltari@gmail.com>
 <20200613083813.2027186-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7996d8c7-c408-40bb-e468-f1121b69f662@gmail.com>
Date:   Sat, 13 Jun 2020 21:52:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613083813.2027186-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:38 AM, Álvaro Fernández Rojas wrote:
> Add support for resetting blocks through the Linux reset controller
> subsystem for BCM63xx SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

With the kbuild robot error fixed:

Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>

Thanks!
-- 
Florian

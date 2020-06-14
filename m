Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DD21F870B
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgFNEsu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEsu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:48:50 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69557C03E96F;
        Sat, 13 Jun 2020 21:48:50 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h10so2382307pgq.10;
        Sat, 13 Jun 2020 21:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=K8Gg3XCjSOi8jPFx//K93rkSBIpmbj/kO0LAEeBzZ7A=;
        b=Bh02xa481JKuT5T4a6EZgLadt2tgUf3qQbu2hrxpNP0lwhEJewFERM+tYk2TJudWWD
         DKGwMiie0nm4yP9GJ/Sxu7zYtC9YVFnabhCy7Spem+iifpQlVaKc8r/Hm8255+Co8GBu
         hi3K+jckShrPVX/OE9++TNrbAeYEQTs9slejE7+CmUWi4iG1N1QVoZ+fwAWbDIEbDRFp
         q9drWhHbxOON+xtPHfPChsHkFAHG4TrB8qrjO3qgSv9xFL3KZi1Cf0Mxkk59mhCzr8f6
         K0QBVt/eGcU5DOk+O0DITpV7kva42aW+G0TnvUZiJftTmEzl1aAQKQCzk13fhn85egs1
         5btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K8Gg3XCjSOi8jPFx//K93rkSBIpmbj/kO0LAEeBzZ7A=;
        b=Y8H/6QPJrj9y9SAtpDax+eQ3ZchvLLSRaCFT1xiszmvlzeXKeJz5PFaPTbVnIjsTAy
         bbtxJJe85XbW4P7R21ZFCEP3JRCBKSUZ1aeQKGYw7YckWS4FnOP4slND4sm2eUYi5fMA
         psftURm5anR63aPKtckTqPu2tUOfwyu1zkT8Stq7vmXtD/i1+W+uN76KPmBBwRgqHkc+
         di3KyNxlFpk0L5vx+d2WsrgF+w261DnFMtVUtwbz6/S9n/vLI46hqJJRXDQbtRbfDRFA
         +MHTO4PKbQ6cdSngCQO6ILinpvZEJO38buFbI5W9y9pghiW7kGdTNDVUty0ekJgWkS5Z
         ufwg==
X-Gm-Message-State: AOAM531XF4NHBAwnzqp9UPV1DxvZuMfHfh029jrXlzPi5BAv/3ALeG5i
        IWEVP6SELiEW6Tq7PFFBlrE=
X-Google-Smtp-Source: ABdhPJyKrCrf8gn9eKJDTSMS/FDWNaHKwW2pYCRg49cZqxI5ntBD8c2w0uNWCPnLadpB0ctMBwcwow==
X-Received: by 2002:aa7:84d9:: with SMTP id x25mr18597156pfn.300.1592110129689;
        Sat, 13 Jun 2020 21:48:49 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id b19sm8845416pjo.57.2020.06.13.21.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:48:48 -0700 (PDT)
Subject: Re: [PATCH v4 9/9] mips: bmips: dts: add BCM63268 power domain
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-10-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a91dfec1-64f1-e1b1-73b6-67e9e96ce38d@gmail.com>
Date:   Sat, 13 Jun 2020 21:48:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613082140.2009461-10-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:21 AM, Álvaro Fernández Rojas wrote:
> BCM63268 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

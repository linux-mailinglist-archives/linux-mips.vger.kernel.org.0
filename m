Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFD0243DCD
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgHMQ7V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMQ7V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:59:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27217C061757;
        Thu, 13 Aug 2020 09:59:21 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t10so2876269plz.10;
        Thu, 13 Aug 2020 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=lSy5II33pB3kE4XX6D+UWACaXPLf2aKpYiiMNaYJDpzczIoPZQLODvaNx6oAhPdXYx
         O81lEBx3Y3FyHwON2KJAdRsjmP2K2pGDkgfFhdFTqWgtAxvwv0Ajdob5HxQhiL5zbmUM
         Gj232ABHEFe9cKgvGOaYQCz2s23xIbPm4Mij+kw81ejqoK6kTIIiVOMdkFpbdYYKkDpH
         wtfFdFwcHxIqSl6ZoKybfSCewePPgCsW1tXeSypM0JLXjWrIGgwOdKdubTyJo1j551at
         65IahFMOnV3DDComNQ11g8K1yy6MxGN1OwgYbQizoW+DE9LWtdbPG0Eq+QGAms1FFwkC
         F8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=eEuS7WhfIX0gx7QEQzEL01pWOMa2rL/QWeLGj84MnDLwcGdukYeWyeiBKl6jzDnVD+
         pCBI/IhNxQqOv/SS1wQHH4yl2qmedFdf+EUkMxskLIOV6RjYCY6KIvMSEgUAlb7vj8LV
         mc6QjvHUIxD/428rkO2aFfE/8HFAD3jMu+ML1PocznKBMCZVghoiCHoHxNfyntkFGscE
         r6B0SBRuIU0KhlnQ3gsZcZ6K6aV9koQkTTfSV0PAeHv5ZfA1512dGFMh6ehC1Zd0RYO0
         fVlt6vAtgmMh4iTdqRUagISigTOVPKDwtcvdZd5piEtjOKOrYueY9nUvJqJkXLZOHn50
         RXKA==
X-Gm-Message-State: AOAM532h/4NWkCED0NaHn8shRsh5/TNtwz3gfuyJXOxIxSwCiLn0ll86
        T6vVw/REUGfyTQCAwE3BXQox8zjM
X-Google-Smtp-Source: ABdhPJy5AehFf8UaVgxMiMxd5DMsB0b9X4h9ej9HkVN96iAYjLvCjGuR3RddaXrad2gUKSrxYnL56A==
X-Received: by 2002:a17:90b:817:: with SMTP id bk23mr5882655pjb.46.1597337960331;
        Thu, 13 Aug 2020 09:59:20 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b15sm5877247pgk.14.2020.08.13.09.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:59:19 -0700 (PDT)
Subject: Re: [PATCH 10/14] mips: bmips: bcm6328: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-11-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cc92a8a7-05e2-fa8d-9588-ca323d5b1c47@gmail.com>
Date:   Thu, 13 Aug 2020 09:59:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-11-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Now that there are proper device tree bindings we can start using them.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

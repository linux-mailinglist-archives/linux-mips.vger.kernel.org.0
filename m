Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8232F34EF00
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhC3RJc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhC3RIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:08:40 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7CAC061574;
        Tue, 30 Mar 2021 10:08:03 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q10so983880pgj.2;
        Tue, 30 Mar 2021 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zjYrAF4ZzvpKQ1l5vfNst6OJLZcB5yoAFqCigpxLEP0=;
        b=lglQoa/2FLvuVXX570JvH4L8xT8TGJVZSdeKR3lhkGTGWal0tJBLqsaSIcKqaJvrWy
         EEbbSOKSVy6Gtd+wpo9lLjGrnGZN4ZkzPlJAWWibYZCjg6u4LDmnRHo9FWL8SJA0XtAF
         rZVb7hymXHkOc8WbDdumYn6F3MmtgrCpSVIGYM2IipmbeAglVNWGt84sH7bTwXQrQ68d
         +bnsdh4QGMQZGwwe3/JX2zfNNFcbwknsGU+aFRC0d1kvz+DXIZQ4joTYR1YaTfRkGoB7
         UYhBMSkuTFSx4s/NxhqKzXTlkhA8HMNNKmMIcRjHl9rtZSqzmxbRtyiScb29/IEzF3ob
         ++VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zjYrAF4ZzvpKQ1l5vfNst6OJLZcB5yoAFqCigpxLEP0=;
        b=jaJdz+TuAafZOwXs3C0SHJkB+5xp4gY4tJaqbB7pCBTUOcNBPBNJGWkTegaZq3CS1n
         e8bWqL0a74LjyUI86OmVTD2Pjbf0uhR3uLeZ/4ihPJO4v7Pa8RP3JmwbLjsGsqu8CRO9
         BHPKS4c09/h9rF5e/w5usROLXvUaiOBUwqQ72JYXj+levAvqkEkxmVBxqrdXC9QejSSd
         zJIJHng8vxDd+DAGma2/4+gJ9++r4Ncp1tMDnio/UeKCFbTQ8XnQn3jSPLcN8NIJgQPQ
         akFhdM+F6SS+VPxHAMUswHzJI1SZ2HAKvwD2TUHyH1zktIpsEpdhQwzvo4ssP6b5Ji44
         Xr5g==
X-Gm-Message-State: AOAM5333YO1+6tqb+WzKh/DIDfhlT5QEmW1kSjB5rgiVE72NMJ1Vq11Q
        hMn0fCRO8hKkbxOGEHhJ/xVhj83c3kk=
X-Google-Smtp-Source: ABdhPJzCefx57UoP0dIwbaDwdrLKEqTnjJy/7LgNcochkJg1DOW36jTnpkFq+CNjh8SuXiILGdUhmQ==
X-Received: by 2002:a62:928f:0:b029:1ef:2370:2600 with SMTP id o137-20020a62928f0000b02901ef23702600mr31622202pfd.9.1617124082297;
        Tue, 30 Mar 2021 10:08:02 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q184sm21064541pfc.78.2021.03.30.10.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:08:01 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] mips: bmips: bcm6328: populate device tree nodes
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314164351.24665-1-noltari@gmail.com>
 <20210314164351.24665-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <95e75721-ff59-1f75-e622-08a4fef2e460@gmail.com>
Date:   Tue, 30 Mar 2021 10:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/14/21 9:43 AM, Álvaro Fernández Rojas wrote:
> - Rename periph_clk to periph_osc.
> - Rename clkctl to periph_clk.
> - Move syscon-reboot to subnode.
> - Add hsspi-osc clock.
> - Add watchdog.
> - Add HS SPI controller.
> - Add NAND controller.
> - Add USBH PHY.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

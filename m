Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A28B2220
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 16:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbfIMOgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 10:36:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44678 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730599AbfIMOgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 10:36:11 -0400
Received: by mail-oi1-f195.google.com with SMTP id w6so2781135oie.11;
        Fri, 13 Sep 2019 07:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=oxIkj2CNgBskqdF16UTAfCDEmh7bzDWtwz7a7nYV7m4=;
        b=oRkdSjAhC71hVz8CkVkuKTXiSeCerJcqFvl7uJ8E8xObFNKQeN+OKn3LeyOocS98wC
         XPiQ2C3O4SMbUA8Vc3DFrkq5FzwbtJYXtt/5kGlC8jfc6qduSZ9Bcbkvu2JKR3t5Ufl4
         qCILinkAmgwTidg+BDUsoW1WRAWEluBkXbGLjR0v0sYpBrJIxeAD/dNaA5nvMZ0J4dV6
         uJejaNrfTmBb9PL6Ue+3UhD3jq63aTM/BNrTjN6rvkZ6ua0FmvX2c31K1GtFLszOfxAT
         dw6xKTCyTST4jlq2yx5Q45yL5qqPeedBQE0FIprkXxqA/we3DDM+XwXBstcb2HKwurQD
         B57w==
X-Gm-Message-State: APjAAAU5meRHrhM5Lp6lF5ACslx0FvzSqrGgjKJqkcCqi28RWJDWhwOK
        Qm9oUte5jjmtTMwKJEBvzk5Y2qk=
X-Google-Smtp-Source: APXvYqxcrl/631YMGwB+UwWJt79oo9grQdoNpC+7iTxV9IDUGlWNjL5LS3tbpSDEWPiQKQIZUpWmpQ==
X-Received: by 2002:a54:4516:: with SMTP id l22mr3435794oil.122.1568385370176;
        Fri, 13 Sep 2019 07:36:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 11sm10231061otg.62.2019.09.13.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:09 -0700 (PDT)
Message-ID: <5d7ba959.1c69fb81.44f68.50b6@mx.google.com>
Date:   Fri, 13 Sep 2019 15:36:09 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: MMC: Add JZ4760 bindings.
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com> <1567669089-88693-4-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1567669089-88693-4-git-send-email-zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  5 Sep 2019 15:38:08 +0800, Zhou Yanjie wrote:
> Add the MMC bindings for the JZ4760 Soc from Ingenic.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  Documentation/devicetree/bindings/mmc/jz4740.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


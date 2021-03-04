Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A6A32DB58
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 21:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhCDUsY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 15:48:24 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38830 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhCDUsM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 15:48:12 -0500
Received: by mail-ot1-f46.google.com with SMTP id a17so3989840oto.5;
        Thu, 04 Mar 2021 12:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NbeMtBQiE3kffLypkBD6RcFRyGfZub8d74bpmkMkLts=;
        b=ag+FGpkaBLFmRAo9sExLZ45PLg87ZSd4bzd9+yBlI+In3qM1o3G7qPS4wpxuEb/UEG
         Li20UaHlLGhJ31wD262HW55EbHbQm/IaaO5x1ICx39DIItM07bXEAsNCr5p4HVyzvr0w
         J4I1gmeWmG81Mb0Kr++A8OLuz4xKUr7UhbSLsThRjEskILbvJIQdpHfna+SLHGJ7OWeW
         jvjebjsyuw5QEGbxotwtc+7YOjKiYf/iL+u7om2unZzkoRkUmQg4HvT4eQO06Yev+eGC
         1VGPfGbOaSABqVJZWmDzTUy9Or4da5qD69Nol/esd1v7w1bP1oOQMq9EaSCnalE68fCk
         yA6Q==
X-Gm-Message-State: AOAM530d5Ixsftep4dSmRt87rvPxK4HWgoFbBEPQOclXJR+cXxXg1fWj
        +0M5tDrjtlLIizB8HeTL5ZLbUNyQpg==
X-Google-Smtp-Source: ABdhPJwIl2l7nLvpxXrcDxLfvNin9yGFjw49oUR2S1ec31zo0UEznVu5/tJZ7VnvEzPfLmFT6jPN5Q==
X-Received: by 2002:a05:6830:3152:: with SMTP id c18mr4914113ots.191.1614890852137;
        Thu, 04 Mar 2021 12:47:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r20sm146415otd.26.2021.03.04.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 12:47:30 -0800 (PST)
Received: (nullmailer pid 2778950 invoked by uid 1000);
        Thu, 04 Mar 2021 20:47:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <20210303062434.22280-7-zhangqing@loongson.cn>
References: <20210303062434.22280-1-zhangqing@loongson.cn> <20210303062434.22280-7-zhangqing@loongson.cn>
Subject: Re: [PATCH v2 6/7] dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
Date:   Thu, 04 Mar 2021 14:47:28 -0600
Message-Id: <1614890848.971360.2778949.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 03 Mar 2021 14:24:33 +0800, Qing Zhang wrote:
> Add liointc-2.0 properties support, so update the maxItems and description.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> 
> v2:
> - Add new patch
> 
>  .../bindings/interrupt-controller/loongson,liointc.yaml  | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.example.dt.yaml: interrupt-controller@3ff01400: reg: [[1072698368, 100]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml

See https://patchwork.ozlabs.org/patch/1446855

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


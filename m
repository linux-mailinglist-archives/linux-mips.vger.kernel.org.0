Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7514C21E5B1
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 04:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgGNCcP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 22:32:15 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43147 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNCcP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 22:32:15 -0400
Received: by mail-io1-f67.google.com with SMTP id k23so15707754iom.10;
        Mon, 13 Jul 2020 19:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vuZsgMdLWQO/ahKQ1C/JJlufkzXzbLL7H9cb+d1HU9k=;
        b=rqifzt8TD6Mil1azgM6lu7g9q2pS1UiUptIHj2ucwHXY7ZEMkJtypqevom+AVMDkot
         gnA6HneVk+i2O63rwfhH8tr4uk9G7VQEzhGzCAJaSP224L13gWAjOqD0orBkf1w59x9+
         gpK6CVFsoaT2YL46qK8MtlaKOx+lvbsDLo1lD+RX6zoKNuMFbs5MdUoJAwU0UQbYE03C
         EJbCFeQUn6/rKOoWWYsdAvCYMxeOHLRt8SmKUGREVeonsfS2msAEAZhv8gqiHO4aEmRa
         Sj3qGaksA+Teo3pvmb/BzVell+Z3RcAsqWqIBAjZKr5PkvFYzjOIBhTNVmKIdwqA1iAw
         W4eg==
X-Gm-Message-State: AOAM533OBg8A6Kv3imDiScRuY0fPW/McygZzuPvR0/4/xrc5Gffev5R/
        lGdyO9JJ2Ft/534SYn3sLMS5KOwFr4x1
X-Google-Smtp-Source: ABdhPJzSiwbxk0e5azgvPYsuI4yurNtqRdxZNnQgVDbStBikimwSnWmtqDpMJgj/pWf09alzKiI/tw==
X-Received: by 2002:a05:6638:2493:: with SMTP id x19mr3577157jat.53.1594693934506;
        Mon, 13 Jul 2020 19:32:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v5sm8522890ios.54.2020.07.13.19.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:32:13 -0700 (PDT)
Received: (nullmailer pid 1163897 invoked by uid 1000);
        Tue, 14 Jul 2020 02:32:12 -0000
Date:   Mon, 13 Jul 2020 20:32:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        paul@crapouillou.net, tsbogend@alpha.franken.de,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH v2 2/3] dt-bindings: MIPS: Add Ingenic X1830 based boards.
Message-ID: <20200714023212.GA1162143@bogus>
References: <20200625173716.56146-1-zhouyanjie@wanyeetech.com>
 <20200625173716.56146-3-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200625173716.56146-3-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 26, 2020 at 01:37:15AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add bindings for Ingenic X1830 based board, prepare for later dts.
> 
> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>  Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
> index d1175030781a..feb695be9f66 100644
> --- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
> +++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
> @@ -8,7 +8,8 @@ title: Ingenic XBurst based Platforms Device Tree Bindings
>  
>  maintainers:
>    - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> -description: |
> +
> +description:
>    Devices with a Ingenic XBurst CPU shall have the following properties.
>  
>  properties:
> @@ -32,8 +33,13 @@ properties:
>            - const: img,ci20
>            - const: ingenic,jz4780
>  
> -      - description: YSH & ATIL General Board CU Neo
> +      - description: YSH & ATIL General Board, CU1000 Module with Neo Backplane
>          items:
>            - const: yna,cu1000-neo
> -          - const: ingenic,x1000
> +          - const: ingenic,x1000e

What's this change? You can't just change bindings.

> +
> +      - description: YSH & ATIL General Board, CU1830 Module with Neo Backplane
> +        items:
> +          - const: yna,cu1830-neo
> +          - const: ingenic,x1830
>  ...
> -- 
> 2.11.0
> 

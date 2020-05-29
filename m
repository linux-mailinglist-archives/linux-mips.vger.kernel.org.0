Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BD41E853D
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2Rjx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:39:53 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36919 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgE2Rjw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 13:39:52 -0400
Received: by mail-io1-f68.google.com with SMTP id r2so224379ioo.4;
        Fri, 29 May 2020 10:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oejLW2TdwFzkqvRhC8zsknCWKVy05wzs3NGL4eb1svQ=;
        b=Nr0kSuG7lGH2UcC+cQxZjakcU8X9cffYPXSgjzJxYY8jLyaHgiYK3XM3iLlz9FGGsM
         4IMr4gGLbSYFsEl7tGmSwIsIvv0KmUrJ/ykvqV1epfzmfqA9JF9bVbaV++FpkiZlRdkE
         ED+cJJWrltHI6Oept/tk3tECKQM9obvuWvobta8KICcScM0YjX3g4ewvYaKwG/Rte6+M
         3QPvtUsUvaAfE7u7vzcOB64MB/WoI99Cjx+VXQSYmWnjv8axNIZlN2PdlN6aF0WtX7+b
         lwpwnNtrGLKmAs5hP+vt0+gw1ng8OE+uLzqQhng7yWF5UA7BmF7sWWq+QS662v/tqOAB
         +qjA==
X-Gm-Message-State: AOAM533SU/UC43v3bbf30EhA8JKl+MBS+E/H5uJlZT6Mx3zsMb6eKzJ/
        Qn6chGqiir8wYCiWa5Z1tg==
X-Google-Smtp-Source: ABdhPJznJnHduW0irWqqNPpY54m6wzGKZYPn70I7kC32C7XPYIeKyJTYhLHFXIfK6TrtTFQk3hgubQ==
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr7559840iow.163.1590773991709;
        Fri, 29 May 2020 10:39:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n27sm5234563ild.76.2020.05.29.10.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:39:50 -0700 (PDT)
Received: (nullmailer pid 2629645 invoked by uid 1000);
        Fri, 29 May 2020 17:39:49 -0000
Date:   Fri, 29 May 2020 11:39:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200529173949.GA2610526@bogus>
References: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
 <20200526170722.17206-2-zhouyanjie@wanyeetech.com>
 <H9DYAQ.4YAB8VVZPLZO@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <H9DYAQ.4YAB8VVZPLZO@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 09:10:29PM +0200, Paul Cercueil wrote:
> Hi Zhou,
> 
> Le mer. 27 mai 2020 à 1:07, 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> a écrit :
> > Document the available properties for the SoC root node and the
> > CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> > 
> > Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> > Tested-by: Paul Boddie <paul@boddie.org.uk>
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > ---
> >  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57
> > ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> > b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> > new file mode 100644
> > index 000000000000..afb02071a756
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Bindings for Ingenic XBurst family CPUs
> > +
> > +maintainers:
> > +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > +
> > +description:
> > +  Ingenic XBurst family CPUs shall have the following properties.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +
> > +      - description: Ingenic XBurst®1 CPU Cores
> > +        items:
> 
> Strip the 'items', put the enum directly.
> 
> > +          enum:
> > +            - ingenic,xburst-mxu1.0
> > +            - ingenic,xburst-fpu1.0-mxu1.1
> > +            - ingenic,xburst-fpu2.0-mxu2.0
> > +
> > +      - description: Ingenic XBurst®2 CPU Cores
> > +        items:
> 
> Same here.
> 
> > +          enum:
> > +            - ingenic,xburst2-fpu2.1-mxu2.1-smt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - device_type
> > +  - compatible
> > +  - reg
> 
> device_type is not in the list of your properties.

It doesn't have to be. There's already a schema for it in dt-schema. 
It's not always required there, so requiring here is fine.

It's an oddity of json-schema, but what's listed in required doesn't 
have to be in 'properties'.

Rob

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB26F19A189
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 00:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgCaWAz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 18:00:55 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34618 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgCaWAy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Mar 2020 18:00:54 -0400
Received: by mail-il1-f196.google.com with SMTP id t11so21067366ils.1;
        Tue, 31 Mar 2020 15:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lc33E5Df9rZgd4qmK0wjmDHg2/VwMCkladXOyRxwDEQ=;
        b=bgXmYjkO/QXHC+uOvMiTFY+STAW8VjaXPbVR42M8rXRfgJyTGV98WTnmjOU10qSwXu
         Vh67M0cgtS6QLN4igqk7j6k9fXI/bJv9c5mGQUzdUbMH18uRsgcQ0JxUBduX0bJZoXmB
         0FSCTPaXAmPOnVNCESe3wND20TGui1dP5pRkJmuVeHXkgq0rV7YcH72kmAs5iWLG3U20
         MrNlBy4PdFxHOXmQRL2bfQfQppmBJQtllF35Cxf1j50nZ+D/GpTpycYBfba3/uh/TB/y
         jqF09l8NLspnMyN4P/Bg7A1cF8+CXvxUMrWv814pe1oOnl2WDZ+li5ZiIh4gDUWAovIK
         pAvw==
X-Gm-Message-State: ANhLgQ3TUlwyn+iGmY4aK4/vcnrdlL90eR/2Rge9hqry+pB4LiQP1TyC
        +KUvMcN4SBrbtFQdfnKtig==
X-Google-Smtp-Source: ADFU+vt2obj9Pp0WVbC2XhGR8Zra56tn+jusDQkYJG1LqYScGnHUFR99v3w+nmrFf44+CRhVQro3Zw==
X-Received: by 2002:a92:1d4b:: with SMTP id d72mr18236810ild.14.1585692053642;
        Tue, 31 Mar 2020 15:00:53 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id n6sm43408iod.9.2020.03.31.15.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 15:00:52 -0700 (PDT)
Received: (nullmailer pid 19586 invoked by uid 1000);
        Tue, 31 Mar 2020 22:00:51 -0000
Date:   Tue, 31 Mar 2020 16:00:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Weijie Gao <weijie.gao@mediatek.com>
Cc:     linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Piotr Sroka <piotrs@cadence.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Arnd Bergmann <arnd@arndb.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Weijie Gao <weijie.gao@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: add documentation for mt7621-nand driver
Message-ID: <20200331220051.GA18084@bogus>
References: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
 <1585678079-5999-2-git-send-email-weijie.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585678079-5999-2-git-send-email-weijie.gao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 1 Apr 2020 02:07:59 +0800, Weijie Gao wrote:
> This patch adds documentation for MediaTek MT7621 NAND flash controller
> driver.
> 
> Signed-off-by: Weijie Gao <weijie.gao@mediatek.com>
> ---
>  .../bindings/mtd/mediatek,mt7621-nfc.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.example.dt.yaml: nand@1e003000: reg: [[503328768, 2048, 503330816, 2048]] is too short

See https://patchwork.ozlabs.org/patch/1264888

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

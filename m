Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800AC176351
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 19:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgCBSzF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 13:55:05 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37892 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbgCBSzF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 13:55:05 -0500
Received: by mail-ot1-f65.google.com with SMTP id i14so328957otp.5;
        Mon, 02 Mar 2020 10:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uWS79D/0ZLL0e/s1oUout/5p5w20WIJlmrFZDFmjEe4=;
        b=MW/FA4tmHQdKbLPYXiyQmytOsiIz4dfBkqDjJVktEmAYpBy7CUkSwE1yn+y7fdQZZG
         3CFgxhxcdDmw5MLYIpDw0z7W5nVGm2L8UEpHfFfvCo9ItLkxJ1yhzzMgg/h7jgVsLakc
         gHnEjLAeizVKhwUXK6R5tpRFNZgO7yPorlbvavMnnbTX6bFjHcyAJmBnDcSq2uZMybtz
         xpAF3fQ9inpqKM4uCpBEoAyO6+MQZnl+F/YBh8wiLyTF3XuMrrU8HP2R2mqXJ1JOnR1B
         GHwFqDoJ7ZyalaNC1v9vQJKsS6u9t0J2JNHeTZMJfNu0E3q3Aw6zMIMzqKGM++4Joq+r
         1zSg==
X-Gm-Message-State: ANhLgQ3K94ZXaH69ZYcThigZ6YbY6X8Sg+vt3MfhcmkeNgGRQE5ap3C6
        LP5yOuYlRpWaylRckyi7+Q==
X-Google-Smtp-Source: ADFU+vt2q1Eduhwf/PVNlCpfWIgnuXW91fEn1d40UCOZdJUjlTwYuw6/BVVLBJDj89BnwQ28P5Q3Hw==
X-Received: by 2002:a05:6830:60b:: with SMTP id w11mr468468oti.350.1583175304589;
        Mon, 02 Mar 2020 10:55:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n64sm6852351otn.35.2020.03.02.10.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 10:55:04 -0800 (PST)
Received: (nullmailer pid 994 invoked by uid 1000);
        Mon, 02 Mar 2020 18:55:03 -0000
Date:   Mon, 2 Mar 2020 12:55:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, Sam Ravnborg <sam@ravnborg.org>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
Message-ID: <20200302185503.GA32613@bogus>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 28 Feb 2020 19:19:26 +0100, "H. Nikolaus Schaller" wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.example.dt.yaml: example-0: 'jz4780-lcdk@0x13050000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1246780
Please check and re-submit.

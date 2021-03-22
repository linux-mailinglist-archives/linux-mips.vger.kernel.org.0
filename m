Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE829344D89
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhCVRi7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:38:59 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:34336 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhCVRi3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:38:29 -0400
Received: by mail-io1-f45.google.com with SMTP id x16so14814662iob.1;
        Mon, 22 Mar 2021 10:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=plEDx3yODuuc0oDuUUpuI2VfkI3CKfscVxs+yXbJJYw=;
        b=G0p1hrLm23ypgOeRLAqVVNtZSp7za21DcFXtXb/7pG3XPm6FvVWd5xWTCORtCyMKXw
         2tg0WCQiaZ01hVeQ1OHHz/x7VyeDdAn+JpJmp4QpBfds23fpekuAN3pk+n/qcTcRjFCf
         1lKr+dmMJxLcuagoAGr0eMkkSLZMKmVy0ncYl8/vUnXHrU6v3CMSaGxZ7fQ9j6HuDz3O
         V1MuZLypnBwbhkPlukaWe8bbG7yuBmWlR0V5owsCp14cWZOXrVRcMhD1xQa16Ox77Ygi
         KiBSNLwcSY5X1yshJQ2CjxTQRsSNUXNn6NqI8964xkUCys/O9rGfsEiCeXs9qZUo3O9G
         kIpg==
X-Gm-Message-State: AOAM531i2XQNodXB2KRIBuuV6TVH17AsqWQJDKFcUGJA5Xr0YYFe6C+Q
        ueim/sBjIodHYi4xUF696A==
X-Google-Smtp-Source: ABdhPJyewsMNUula+4VN8UXChdp+DNLqtLdxAkqFQimXzm+foycbj2gxhUuukwaAaSLd+7g4S8ZNiQ==
X-Received: by 2002:a5d:93c2:: with SMTP id j2mr728270ioo.166.1616434709207;
        Mon, 22 Mar 2021 10:38:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c19sm8270300ile.17.2021.03.22.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 10:38:28 -0700 (PDT)
Received: (nullmailer pid 2887760 invoked by uid 1000);
        Mon, 22 Mar 2021 17:38:18 -0000
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robin van der Gracht <robin@protonic.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210322144848.1065067-3-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org> <20210322144848.1065067-3-geert@linux-m68k.org>
Subject: Re: [PATCH 02/17] dt-bindings: auxdisplay: ht16k33: Document Adafruit segment displays
Date:   Mon, 22 Mar 2021 11:38:18 -0600
Message-Id: <1616434698.367681.2887759.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 22 Mar 2021 15:48:33 +0100, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Document compatible values for the Adafruit 7-segment[1] and
> 14-segment[2] FeatherWing expansion boards with red displays.  According
> to the schematics, all other Adafruit 7-segment and 14-segment display
> backpack and FeatherWing expansion boards (including bare boards and
> boards fitted with displays) are compatible with these two boards.
> Add a "color" property to support the different color variants.
> 
> [1] https://www.adafruit.com/product/3108
> [2] https://www.adafruit.com/product/3130
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Alternatives I considered:
>   1. Document the attached display type in a child node.
>      I.e. specify segment type, number of characters, and wiring.
>      Especially the latter would become really complex, due to the sheer
>      amount of possible wiring combinations.
>      Using this method, you also loose the ability to just connect a
>      display to an i2c bus, and instantiate the device from sysfs,
>      without using DT:
> 
> 	echo adafruit,3130 0x70 > /sys/class/i2c/i2c-adapter/.../new_device
> 
>   2. Do not use the "color" property, but document all Adafruit
>      7-segment and 14-segment display backpack and FeatherWing expansion
>      boards.
>      This would lead to a myriad of compatible values:
> 
>       - items:
> 	  - enum:
> 	      - adafruit,878      # 0.56" 4-Digit 7-Segment Display Backpack (Red)
> 	      - adafruit,879      # 0.56" 4-Digit 7-Segment Display Backpack (Yellow)
> 	      - adafruit,880      # 0.56" 4-Digit 7-Segment Display Backpack (Green)
> 	      - adafruit,881      # 0.56" 4-Digit 7-Segment Display Backpack (Blue)
> 	      - adafruit,1002     # 0.56" 4-Digit 7-Segment Display Backpack (White)
> 	  - const: adafruit,877   # 0.56" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1268     # 1.2" 4-Digit 7-Segment Display Backpack (Green)
> 	      - adafruit,1269     # 1.2" 4-Digit 7-Segment Display Backpack (Yellow)
> 	      - adafruit,1270     # 1.2" 4-Digit 7-Segment Display Backpack (Red)
> 	  - const: adafruit,1271  # 1.2" 4-Digit 7-Segment Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,1911     # 0.54" Quad Alphanumeric Display Backpack (Red)
> 	      - adafruit,1912     # 0.54" Quad Alphanumeric Display Backpack (Blue)
> 	      - adafruit,2157     # 0.54" Quad Alphanumeric Display Backpack (White)
> 	      - adafruit,2158     # 0.54" Quad Alphanumeric Display Backpack (Yellow)
> 	      - adafruit,2159     # 0.54" Quad Alphanumeric Display Backpack (Yellow-Green)
> 	      - adafruit,2160     # 0.54" Quad Alphanumeric Display Backpack (Green)
> 	  - const: adafruit,1910  # 0.54" Quad 14-segment Alphanumeric Backpack
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3106     # 0.56" 4-Digit 7-Segment FeatherWing Display (Blue)
> 	      - adafruit,3107     # 0.56" 4-Digit 7-Segment FeatherWing Display (Green)
> 	      - adafruit,3108     # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> 	      - adafruit,3109     # 0.56" 4-Digit 7-Segment FeatherWing Display (White)
> 	      - adafruit,3110     # 0.56" 4-Digit 7-Segment FeatherWing Display (Yellow)
> 	  - const: adafruit,3088  # 0.56" 4-Digit 7-Segment FeatherWing
> 	  - const: holtek,ht16k33
> 
>       - items:
> 	  - enum:
> 	      - adafruit,3127     # 0.54" Quad Alphanumeric FeatherWing Display (White)
> 	      - adafruit,3128     # 0.54" Quad Alphanumeric FeatherWing Display (Blue)
> 	      - adafruit,3129     # 0.54" Quad Alphanumeric FeatherWing Display (Green)
> 	      - adafruit,3130     # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> 	      - adafruit,3131     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow)
> 	      - adafruit,3132     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow-Green)
> 	  - const: adafruit,3089  # 0.54" Quad 14-segment Alphanumeric FeatherWing
> 	  - const: holtek,ht16k33
> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml:54:16: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 54, column 16
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 54, column 16
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1456639

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB78843F4E7
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 04:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhJ2CSX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 22:18:23 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40583 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhJ2CSW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 22:18:22 -0400
Received: by mail-ot1-f45.google.com with SMTP id 71-20020a9d034d000000b00553e24ce2b8so6805333otv.7;
        Thu, 28 Oct 2021 19:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=MhaSmrBQtbkr94LNt4h9AKG7WEafonEBYR5HwoAlJj4=;
        b=lZwor3BntJGQKEndhkySeNCanzidsLCCGyk+ylbNlnNmstKOq7KgTk1ca1HBsQQGfP
         FBNDx0zkkarsW7kohHnEB030sNkTj8mwyOBzx9W+TncH9F9ragpsQFMfunOTFReDaYik
         73hpW3qAvsdGprKBc/HrLHmdHQ8IdGGIkdbiVXr78HV+C5Ag4QYujSmleNymFqX1wiAh
         Nu+NWa8sLjEcmcpgr72ZZ2Th1PFqus6LVw5TTV7QM8i2U5K1Y2EBiwLs/Zk5JBCcyAs3
         fflhA5l2p4CGMYfvVsP0iB70CymeEuLY+q0lNivJ49pswSRg6/NwP61tJ9M+vsSeZySl
         eA4w==
X-Gm-Message-State: AOAM531zThi8RueCtwq7902Oxhj7JlLVKFm1q7TnABgrj9qkfG74UU3v
        gcVC1227BbaagBRkCWzn9Q==
X-Google-Smtp-Source: ABdhPJyG+qFnBhbco3mrdQyViSYz7rqmTLqsNjPQ1D0awRhHYjyg4z/RIbOckcnBQFDQHEifKWuygw==
X-Received: by 2002:a05:6830:268f:: with SMTP id l15mr6470222otu.59.1635473754477;
        Thu, 28 Oct 2021 19:15:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o2sm1503321otl.34.2021.10.28.19.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 19:15:53 -0700 (PDT)
Received: (nullmailer pid 1025965 invoked by uid 1000);
        Fri, 29 Oct 2021 02:15:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, rafal@milecki.pl,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org
In-Reply-To: <20211028172322.4021440-3-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com> <20211028172322.4021440-3-f.fainelli@gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Thu, 28 Oct 2021 21:15:52 -0500
Message-Id: <1635473752.980618.1025964.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 28 Oct 2021 10:23:17 -0700, Florian Fainelli wrote:
> The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
> compatible string which is the first instance of a DSL (BCM63xx) SoC
> seeing the integration of such a watchdog timer block.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml:19:5: [error] duplication of key "const" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 18, column 5
found duplicate key "const" with value "brcm,bcm7038-wdt" (original value: "brcm,bcm6345-wdt")
  in "<unicode string>", line 19, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 612, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 18, column 5
found duplicate key "const" with value "brcm,bcm7038-wdt" (original value: "brcm,bcm6345-wdt")
  in "<unicode string>", line 19, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1547626

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


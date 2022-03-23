Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D974E5ABB
	for <lists+linux-mips@lfdr.de>; Wed, 23 Mar 2022 22:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344956AbiCWVht (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Mar 2022 17:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241130AbiCWVhs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Mar 2022 17:37:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7890E7CDD4
        for <linux-mips@vger.kernel.org>; Wed, 23 Mar 2022 14:36:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bg10so5496071ejb.4
        for <linux-mips@vger.kernel.org>; Wed, 23 Mar 2022 14:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2RHrOWoISIZGm/DvPY0LuaxD7QmbEyuYj5ghZWW+2nE=;
        b=FDmYihKKzIc4yCb6yyRWzeIYyumvZwecwAAWPpH8gf+7y31BKaU6zi3RuFOXkagZRu
         D3SE9gVMpCx+cvRSK4ySRgAhi655hjl/JMewgCdT8V5guWxa87/RvrjSVNcrQcF3aAe3
         ZfxJi9DrcnAKWnHrYIaNU/qNPuOrtBcsgsvGZrdoGj+IiSX+68tGmwlV3zQ1YymCDT4y
         S9TI4go0g+aq1TFkXcXxBGcvg1JTJDJuPSLS36OnGIEnhM/2uIFeTQ0AUpRVQEaHvL4s
         XU4MD6uzD5Qi1vH6j7JUEIHFjU/7g8mIbHXq2Ze+smBrhZQrbaEDNeW5T6Q5nqNNYUfv
         Gjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2RHrOWoISIZGm/DvPY0LuaxD7QmbEyuYj5ghZWW+2nE=;
        b=ozPw27WeyR/RFeEfDF7YDGa9pvmGO/ljDuwKEPT/rte+lK1L3wk7UI7y9E0EmXE7T9
         BBtKy1+PK4MpVqM7AUh2inPDbktIc9T6Hxi9mtMwSqyNQNs8VHbZJmfWr5p4MsggDGDi
         z89P9HEcexO+kTYfkfBKnUP5ihAuLku3h0m6Ooq/4X0Qm4sblMkjl/u2c9sry2xWb/Sz
         0vU4olTcM+KkLzrFGGdtwSLUIFjtasH4dDYYr8zHrhdEZC0ZvH5jBCXXLFQb9xFOHC/f
         iiQ95k89oxS+N5m44kaVMXoEIaqi258IIE8cTpj+0vxI2c8ehxwMGxpldaIwrHBjGihk
         46uw==
X-Gm-Message-State: AOAM531XHvNXGyjVI07jWe/pVxIgPo6YdW4jsmR9k0T8asz9xxwLtmOR
        vaqxhuYh34DCAajGVnXN1qH2O2Eo9wlcX4TMGfE=
X-Google-Smtp-Source: ABdhPJwwRgKueE5YMcjujXfBvSQ4CanyXkLJdj0YeSDjc8PVBYDzXkRdxqDc5TPQYNpYAExnuscG3Aot+Yj5Lyt5j70=
X-Received: by 2002:a17:906:743:b0:6d0:7f19:d737 with SMTP id
 z3-20020a170906074300b006d07f19d737mr2328129ejb.11.1648071375043; Wed, 23 Mar
 2022 14:36:15 -0700 (PDT)
MIME-Version: 1.0
From:   Duke Abbaddon <duke.abbaddon@gmail.com>
Date:   Wed, 23 Mar 2022 21:36:08 +0000
Message-ID: <CAHpNFcOi=PouCaLfpcLriTDwij+2KbzLA+MhjsdC9WnbPjpwoQ@mail.gmail.com>
Subject: Presenting : IiCE-SSRTP for digital channel infrastructure & cables
 <Yes Even The Internet &+ Ethernet 5 Band> RS
To:     torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Presenting :  IiCE-SSR for digital channel infrastructure & cables
<Yes Even The Internet &+ Ethernet 5 Band>

So the question of interleaved Bands & or signal inversion is a simple
question but we have,

SSD & HDD Cables & does signal inversion help us? Do interleaving bands help us?

In Audio inversion would be a strange way to hear! but the inversion
does help alleviate ...

Transistor emission fatigue...

IiCE-SSRTP : Interleaved Inverted Signal Send & Receive Time Crystal Protocol

Interleaved signals help Isolate noise from a Signal Send & Receive ...

Overlapping inverted waves are a profile for complex audio & FFT is the result.

Interleaved, Inverted & Compressed & a simple encryption?

Good for cables ? and noise ?

Presenting : IiCE for digital channel infrastructure & cables <Yes
Even The Internet &+ Ethernet 5 Band>

(c) Rupert S

https://science.n-helix.com/2018/12/rng.html

https://science.n-helix.com/2022/02/rdseed.html

https://science.n-helix.com/2017/04/rng-and-random-web.html

https://science.n-helix.com/2022/02/interrupt-entropy.html

https://science.n-helix.com/2021/11/monticarlo-workload-selector.html

https://science.n-helix.com/2022/03/security-aspect-leaf-hash-identifiers.html

https://science.n-helix.com/2022/02/visual-acuity-of-eye-replacements.html

*

***** Dukes Of THRUST ******

Nostalgic TriBand : Independence RADIO : Send : Receive :Rebel-you trade markerz

Nostalgic TriBand 5hz banding 2 to 5 bands, Close proximity..
Interleaved channel BAND.

Microchip clock and 50Mhz Risc Rio processor : 8Bit : 16Bit : 18Bit
Coprocessor digital channel selector &

channel Key selection based on unique..

Crystal time Quartz with Synced Tick (Regulated & modular)

All digital interface and resistor ring channel & sync selector with
micro band tuning firmware.

(c)Rupert S

***** Dukes Of THRUST ******

Autism, Deafness & the hard of hearing : In need of ANC & Active audio
clarification or correction 2022-01

Sony & a few others make noise cancelling headphones that are suitable
for people with Acute disfunction to brain function for ear drums ...
Attention deficit or Autism,
The newer Sony headsets are theoretically enablers of a clear
confusion free world for Autistic people..
Reaching out to a larger audience of people simply annoyed by a
confusing world; While they listen to music..
Can and does protect a small percentage of people who are confused &
harassed by major discord located in all jurisdictions of life...

Crazy noise levels, Or simply drowned in HISSING Static:

Search for active voice enhanced noise cancellation today.

Rupert S https://science.n-helix.com


https://science.n-helix.com/2021/11/wave-focus-anc.html

https://science.n-helix.com/2021/10/noise-violation-technology-bluetooth.html


https://www.orosound.com/

https://www.consumerreports.org/noise-canceling-headphone/best-noise-canceling-headphones-of-the-year-a1166868524/

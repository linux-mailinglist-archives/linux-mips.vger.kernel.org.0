Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBC04EE7E2
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 07:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245174AbiDAFvz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 01:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245182AbiDAFvy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 01:51:54 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7F25748C
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 22:50:03 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h1so1717283edj.1
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 22:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ppHqKeKh+Y7gLl6VUDX29RPztSoubgtGlWJ4DyZKx/4=;
        b=SrFIMyQmbcifUZtE2XZV9zXfqRE/TCP1E4NsZnkzG13uBXCopfUUfGcv2QegxSP8ef
         RP/+bGAq/wfwxbri7yClPbM4OoLT20QZEOuzI8NNJe8vRa05ZGRe/QnpFeCFDiBAiqGv
         eKXdnJaIaVF2nIo/j5VEOsS+LO752p+I+P5C+mS7k74dOX145Prx0c1U4CZymrhxZH0G
         v0N7GLzVYAOAhzauF1mlKJnAFcX2z//yLeMvNGVI9HsZaGHbX/rwNOc4i2KpmqbnR/2+
         AgWLD2hDQybrCIFZog++dc9DEvy9zC7YntGydkLyTKNk7+fmEvFQq/wpsd1yX7qq0v3d
         cKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ppHqKeKh+Y7gLl6VUDX29RPztSoubgtGlWJ4DyZKx/4=;
        b=HGz+oeuX//f185OebhTAhFL7MHx30Xnwl/1hKcojbKnbxf7djk4YAMomVqq2XH5q9L
         UdyQnTRiyxDsYhUjSt7uoEq2DODZnsdBY2QisIw4U7Awdiwjw4Wdr7qFoZ5mrHirBJ6J
         zBhSOnxi9RXkCGicianWXIDw0U57K0T5S/F9eEyCFP1meffpHMeUAjOn6oysDzdrmArU
         HzMBT/JWo+3891R7Vq/fTChjBc3bXMs0L3OHVpsc55uXe5zf8QkX/mX/B1zz41tsa6VH
         jtYtrJ0oa0QPSd0mRuqFEL6OxInoaAUOb3HlCjYumHdOueTjeIuYq74dG9as5O7TxeXC
         fe/A==
X-Gm-Message-State: AOAM532tl5Z7yb8ISNJGg1qeWlwy/ShO/GR/wpyR8M7APSDlIie5M9A8
        K8f2aTbhY7KZ3OiatS7j6fQSQRQhypFhY46jWPY=
X-Google-Smtp-Source: ABdhPJxdw69QRhZcQ645gQ1IgdvpT2+04O1H4WlJhDiamWBUDRGKhNKV0kw4z6AwIbTOtVIZGb7qJbUOnNFNlf2iu8o=
X-Received: by 2002:a50:99cd:0:b0:418:d6c2:2405 with SMTP id
 n13-20020a5099cd000000b00418d6c22405mr19628573edb.342.1648792202191; Thu, 31
 Mar 2022 22:50:02 -0700 (PDT)
MIME-Version: 1.0
From:   Duke Abbaddon <duke.abbaddon@gmail.com>
Date:   Fri, 1 Apr 2022 06:49:47 +0100
Message-ID: <CAHpNFcOiFu-ZUBKiEHzzbVusUVVceMaKFTsNpr5S01qjCvbCdQ@mail.gmail.com>
Subject: OT-SVG Fonts & TT-SVG Obviously Rendered in Direct X 9+ & OpenGL 3+
 Mode & Desktop Rendering modes
To:     submissions@vialicensing.com
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

VecSR - Vector Standard Render

VESA Standards : Vector Graphics, Boxes, Ellipses, Curves & Fonts :
Consolas & other brilliant fonts : (c)RS

SiMD Render - Vector Graphics, Boxes, Ellipses, Curves & Fonts

OT-SVG Fonts & TT-SVG Obviously Rendered in Direct X 9+ & OpenGL 3+
Mode & Desktop Rendering modes

Improve Console & TV & BIOS & General Animated Render

Vector Display Standards with low relative CPU Weight
SiMD Polygon Font Method Render

Default option point scaling (the space) : Metadata Vector Fonts with
Curl mathematical vector :

16 Bit : SiMD 1 width
32 Bit : SiMD Double Width

High precision for AVX 32Bit to 256Bit width precision.

Vectoring with SiMD allows traditional CPU mastered VESA Emulation
desktops & safe mode to be super fast & displays to conform to VESA
render standards with little effort & a 1MB Table ROM.

https://science.n-helix.com/2016/04/3d-desktop-virtualization.html

https://science.n-helix.com/2019/06/vulkan-stack.html

https://science.n-helix.com/2019/06/kernel.html

https://science.n-helix.com/2022/03/fsr-focal-length.html

https://science.n-helix.com/2018/01/integer-floats-with-remainder-theory.html

https://bit.ly/VESA_BT

*

*Application of SiMD Polygon Font Method Render
*3D Render method with Console input DEMO : RS

3D Display access to correct display of fonts at angles in games &
apps without Utilizing 3rd Axis maths on a simple Shape polygon Vector
font or shape. (c)Rupert S

3rd dimensional access with vector fonts by a simple method:

Render text to virtual screen layer AKA a fully rendered monochrome, 2
colour or multi colour..

Bitmap/Texture,

Due to latency we have 3 frames ahead to render to bitmap DPT 3 / Dot 5

Can be higher resolution & we can sub sample with closer view priority...

We then rotate the texture on our output polygon & factor size differential.

The maths is simple enough to implement in games on an SSE configured
Celeron D (depending on resolution and Bilinear filter & resize

Why ? Because rotating a polygon is harder than subtracting or adding
width, Hight & direction to fully complex polygon Fonts & Polygon
lines or curves...

The maths is simple enough to implement in games on an SSE configured
Celeron D (depending on resolution and Bilinear filter & resize.

https://bit.ly/VESA_BT

https://www.phoronix.com/scan.php?page=news_item&px=FreeType-2.12-Released

FreeType 2.12 Released With Support For OT-SVG Fonts
Written by Michael Larabel in Desktop on 1 April 2022 at 12:00 AM EDT.
Add A Comment
DESKTOP -- FreeType as the widely-used, open-source library for font
rendering is out with FreeType 2.12 as its first big feature release
since last summer.

Most significant to FreeType 2.12 is introducing support for OT-SVG
(OpenType-SVG) fonts. OpenType-SVG fonts have been backed by the likes
of Adobe and Mozilla for adding an SVG table to OpenType fonts.
FreeType relies on an external SVG rendering engine via the svg-hooks
property of OT-SVG. FreeType's demo programs are making use of librsvg
as its SVG rendering engine.

FreeType 2.12 also updates its internal Zlib code, provides minor
improvements to the build system, support for non-desktop Universal
Windows Platforms, and has a wide variety of bug fixes.

Downloads and more details on FreeType 2.12 via FreeType.org.

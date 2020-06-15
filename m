Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556DD1F8D78
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 08:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgFOGDP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 02:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgFOGDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 02:03:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB3CC061A0E;
        Sun, 14 Jun 2020 23:03:14 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id u128so264046pgu.13;
        Sun, 14 Jun 2020 23:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E6bUhhLBdDf7TEFMc7mP9C+VEWjkMtwdlcuI6qBZGPs=;
        b=K/yT5K4eU2tG5K6BJc+qeRZ8S+umEdbo124hvree3KZIV8kR2o6yhISkU8tDfaUQTe
         k7z0aQJ2QNkMT+YsIS1A/4qbNp2scUmh+GFn4v5/g6eRW5tk5gsoBbFZ4yRrW6UqrYLl
         fABEwtLZCqalDfCqFqpZz5jPqam/3qx1bslCAsFM39aOpXbD0QfSTW72HpFurnBXfIwo
         +Y9zeWj3iM4szazyeAYaJPIADjJWBctjFgSrdq0J7FphEg96KfYpAL7EgzQoxOfPDf3J
         DIq+3VuDrQz9Fe8tA0Q0iz6RdxYWGLRDRFhm7WSkfYNftY8ZDeLZrXW4CdWvjMtYv/ff
         ykWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=E6bUhhLBdDf7TEFMc7mP9C+VEWjkMtwdlcuI6qBZGPs=;
        b=nln/rO5ggQowf+/3AaZw7MHtt4yYaPYWzXbl3xbAjf6CexgLHb45s3OzHTPhj1rI/M
         z7Z2mxCeO54MneWulz0orzYhHRRwzWnLReqBJMWRwt+VhxkJryQDxF5LQ9dFY06RgfyJ
         rpGGkCYEgXgzw/UcXuukXjQKuDZJFWe09pxg5Cj+4f3Zz1AbuInt9XmnoLyJYou5PfUI
         nvb06V5+QzTkC1eIoXTT49IppHkVwxKKgNIv+VoUuK6tei0FQFnzkUbhcstFUIceyWMh
         hE7nl4eg+y3siaS/MPancBZ+dK62kJtt8Pc5DeMPdzoTCnpyVOKEBDYifbxDuqob1HhC
         tUJw==
X-Gm-Message-State: AOAM533jsYFFitgLUo4jWn4DVD1lT9AlgewN6cRxM1C+OFJYpnkuOfkY
        SKbpD6h6IHKwhybCPtPIxRY=
X-Google-Smtp-Source: ABdhPJzue8CJx1FPUD1qbN98eeZtLbepz8Z+qoZ6GlCfrh+3E+k6tXbx1LwaUFj6WIKnHeoD5R5m8w==
X-Received: by 2002:a63:8f54:: with SMTP id r20mr19412316pgn.165.1592200993997;
        Sun, 14 Jun 2020 23:03:13 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id z1sm11470922pjz.10.2020.06.14.23.03.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2020 23:03:13 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/2] dt-bindings: mips: Document two Loongson boards
Date:   Mon, 15 Jun 2020 14:04:17 +0800
Message-Id: <1592201057-28151-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
References: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document loongson64c-4core-ls7a and loongson64g-4core-ls7a, two boards
with LS7A PCH.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 Documentation/devicetree/bindings/mips/loongson/devices.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index 0516fe2..88c5a29 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -17,6 +17,10 @@ properties:
   compatible:
     oneOf:
 
+      - description: Classic Loongson64 Quad Core + LS7A
+        items:
+          - const: loongson,loongson64c-4core-ls7a
+
       - description: Classic Loongson64 Quad Core + RS780E
         items:
           - const: loongson,loongson64c-4core-rs780e
@@ -24,4 +28,8 @@ properties:
       - description: Classic Loongson64 Octa Core + RS780E
         items:
           - const: loongson,loongson64c-8core-rs780e
+
+      - description: Generic Loongson64 Quad Core + LS7A
+        items:
+          - const: loongson,loongson64g-4core-ls7a
 ...
-- 
2.7.0


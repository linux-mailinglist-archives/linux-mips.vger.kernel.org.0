Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD7B561FCB
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jun 2022 17:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbiF3P6D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jun 2022 11:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbiF3P6B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jun 2022 11:58:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140413EAB8
        for <linux-mips@vger.kernel.org>; Thu, 30 Jun 2022 08:58:01 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id k22so27963145wrd.6
        for <linux-mips@vger.kernel.org>; Thu, 30 Jun 2022 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=A6WkR2bbX+6nKt+MXz/xw/8OXFUy+eOLExGLg7mZyEY=;
        b=FG9ZNau4xcArYqHZU53osU9wBtIjHDoYAZQEMi41kgfZEiYql4Y9GNxsDIIn5SDr2h
         btoE1NwbB2eT54dti/lSX6XZKnZuJCYRMGcT9oeiyo8CPMBrSKfPXaIAENuVxF0N/W96
         NlhJ34B6mx9m38s66t5cSApZk8QOTNki1PXVqtLbtHv1MUOLo/IJGxdLCYiQ1JRUdT6Y
         sawvDJ67VbjNU5nZMGmCNg31dfnYDI/vGUIujvFhZC27N1GBHi9Hg2yUyJax9zgfkL/O
         zDKxdQQXcU9kAws8pH6p7+3CTzQonwzcJRtWBC2VEkTYh0i2NK1AxZyAtroGmu2eUpEn
         LD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=A6WkR2bbX+6nKt+MXz/xw/8OXFUy+eOLExGLg7mZyEY=;
        b=6LOca5MJsELQYCnpGX/wFNxIH7PkcCq5U8ytR1iPsacpMGR5V1c9Nq14BhAQHdRg0K
         OsNw1GiP9WRVxXNXC+Cksbq4oeGXBigQ+wvJcwUNSTyVOcar1ooAel44MqJNOUBr1iBH
         ll8dCjPK6UQXWSXFykFHCkZDBacoz0leh989A24WBvtzw6IQZT+R4P3wmcH1M+S8VuMk
         63H+oh1N/MtVsGbpdzSfKGgV7DzYxCRiKjYnr0wSpGwLgLzYI+Py3Nf6w3So5Jr8cQH0
         P3UWdyjszRdtpx2Mnhqv5PfRGeypVQ/bylW3Xk/6H/mczzwrPCTRDHBOUL4AYifreyGf
         bVOw==
X-Gm-Message-State: AJIora9WNGKb9QzUHqBhclM96brxwmOTX8bVpkQGp8/baLF8qIMIomj2
        iwIOAxKtPcBLoPqwS42FJo9u15qstBLp1g==
X-Google-Smtp-Source: AGRyM1ui0QQXC/oXHSXuHU0CHhdv6Go4mHXz2d0g2yMviLXtVSyVXE+huSPONNy07FWdaENcEf6Y7A==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id bk24-20020a0560001d9800b0021baead9b6cmr9187724wrb.531.1656604679448;
        Thu, 30 Jun 2022 08:57:59 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b0039c362311d2sm3590148wmi.9.2022.06.30.08.57.58
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:57:59 -0700 (PDT)
Message-ID: <62bdc807.1c69fb81.38408.8132@mx.google.com>
Date:   Thu, 30 Jun 2022 08:57:59 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:58:00 -0400
MIME-Version: 1.0
From:   prichard.dreamlandestimation@gmail.com
To:     linux-mips@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0APrichard Peter=0D=0ADreamland Estimation, LLC


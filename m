Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE5C468903
	for <lists+linux-mips@lfdr.de>; Sun,  5 Dec 2021 05:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhLEEHv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Dec 2021 23:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhLEEHv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Dec 2021 23:07:51 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2DCC061751
        for <linux-mips@vger.kernel.org>; Sat,  4 Dec 2021 20:04:24 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id iq11so5248153pjb.3
        for <linux-mips@vger.kernel.org>; Sat, 04 Dec 2021 20:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=YxA8dbBpYdg+iGkezIZn/5BAbOEydifCudsz/hiK9mCcuh9GzAcjHrSuSAPaXjBzCd
         c0IHt6sc5giTYNe7CC7h+8IKBivhwxMqhmZGDmnbVa3bj9ybDcbt+e1TFt8bn+WWtU1c
         Y95EgFHDjMXQnSlw++n43PA+EJk9B9mtvXFsbtcWrRotqbSAjA+pwpStVOf5+ladNbjM
         oOvrIWtX4n9PoZcFxI/67CF5PCTTCcz58A4LLX+Uq5nKdCXVDjBh6d9+UO60OljjbJ5V
         IsXmaUO3ugvUnQNqLLe+MHH1WhS/D0QyTzXNeUGgWJ9TCOMLDSLssDfMAMRN9Dqa6T9c
         UwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=etDsOsklTFhdv20/ihPgdxxbpxkX/HMYSlW+AO+gqjs=;
        b=PlnN3ldFJLZN8q+BEXBNLOukMeCyIm4etATbkRXIfL12mj1FO9Xvp8G4LpA/FdMZjD
         EAJmxa8dfd9UlPL3BWZATqlcnCnugz2Vy1I0GcAQJ5Ua2JlW2Y6mWUcAJsUXJjaiTRpT
         X4LAYFJiQdPI2i/dlkykBAKbFO5GQ100SHUTuBZIhQEIQ5n6eQ87Qg6820EoTrVJixkB
         MWn3EnTELM21Zusq+rwkupAtTRb/2HywILgbTK6vrbhQpCzFaM3rE0bebvfXwvIqM6TB
         OIlA0KCE14d4fn9cmagHTFVPhkL25b1f0Rgq+TSAaGikZbTR2pw7ofWriZlPUgYfEcL1
         jdaw==
X-Gm-Message-State: AOAM532/uO3Xm1UyyeSPUOvSUt1zGT/bRmVAY8nv2yz0iinyVMXUdIHA
        VsI8CyoafYmxkD/+dm4BI71uKXeqgzmRmkoynKM=
X-Google-Smtp-Source: ABdhPJyRvZJQGdndEBjd2UKJKmLVBrivVQXSkixgSiuRDWfvyPlNBWxBQugB8W7SwXTAvcRbOi1tG5SyPKq/4mMrt0c=
X-Received: by 2002:a17:90b:110a:: with SMTP id gi10mr26757176pjb.124.1638677064093;
 Sat, 04 Dec 2021 20:04:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:1183:b0:43:1fd0:a9a5 with HTTP; Sat, 4 Dec 2021
 20:04:23 -0800 (PST)
Reply-To: fionahill.usa@hotmail.com
From:   Fiona Hill <fionahill578@gmail.com>
Date:   Sat, 4 Dec 2021 20:04:23 -0800
Message-ID: <CAFw126FRNX20M9nHKPivTN=MX7rU=ASg9XY==KwYQYbdTF22Gw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Hello did you see my message i send to you?

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CEDE09D7
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 18:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732903AbfJVQ5T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 12:57:19 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25475 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732163AbfJVQ5S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Oct 2019 12:57:18 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571763428; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=AnGQBBDj9gdcQBs5B6+gqXfvUpk2XtfJhcIT2Y1ofM13kxXg6IB2w+yRQfX40u3m+6TquOvx71meGpJnK4Y/yi1QE7vc+ljJLma5SzaarFVRqDUuP6TPIvccUl8XXcVDyHZaVsw7qeKsTE5D76noQItacWuQP+c8W1WasAoUJ9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1571763428; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=WoO9opLwGLvO34UBH8Z3GqzsC7d/WfsWFU9zGxpzK1c=; 
        b=Dwf8RmVvYC+nOZZTBWAPt2QHT+ZRoU+Mw7TS/Q4riEot1uFkMDfhKTFdTWcxHfAfYK/dsFXzAdKDXLDgy/LxEY9GxT+9Q6R5YSl9ciQhKU9KPuuzk5xT9GocZ7aNdz510kbxAnR6qMDlmD3hMRhk5BXr8qrS7hCKXfgvkenv5is=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=WdVnvx/XofvgipZWW4wx+IhBsnUMnhZ7EN+D1g/ZEa9VXL9OZ0g26ofjn0Z5tqg5aXR8uG+dEmGs
    F8lynGAJQf9Yb+tTLStNg8L5fretYM9xqepvQcfjKFnfvCnbxATt  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571763428;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=155;
        bh=WoO9opLwGLvO34UBH8Z3GqzsC7d/WfsWFU9zGxpzK1c=;
        b=JFID7DAmru8jMM2KssJdH7gG/O1nG5bsNASlwG+kNyz4n55F4YaF/Esto6W1c/PM
        UtxQHzmXJQs+fB0GubDQ1ceZMHJaZhResFDvCNU5dOSWmSmfFpE+glDmoKTTuNV/KcH
        81ZFdP1ng1UmJQfpVARVY9fFoaPaL83r4I8H1uWg=
Received: from localhost.localdomain (171.221.113.199 [171.221.113.199]) by mx.zohomail.com
        with SMTPS id 1571763428292197.9872646436479; Tue, 22 Oct 2019 09:57:08 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mturquette@baylibre.com, sboyd@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net
Subject: clk: X1000: Add support for the X1000 v2.
Date:   Wed, 23 Oct 2019 00:56:27 +0800
Message-Id: <1571763389-43443-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:use BIT() macro instead left shift, add a call of
"ingenic_cgu_register_syscore_ops()", replace "CLK_OF_DECLARE"
with a "CLK_OF_DECLARE_DRIVER".


